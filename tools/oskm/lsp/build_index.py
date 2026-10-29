#!/usr/bin/env python3
# -*- coding: utf-8 -*-

#
# Copyright (c) 2026 Huawei Device Co., Ltd.
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

"""Build the clangd background index (.idx shards) for an OpenHarmony build.

Invoked by oskm_collect.py in the postTargetCompilation phase, or standalone:

    python3 build_index.py -i out/rk3568 [options]

Flow:
  1. resolve source root (from this script's location) and the out dir
  2. locate clangd (LSP_CLANGD_BIN > bundled clangd/ > PATH > OHOS prebuilts)
  3. verify compile_commands.json exists in the out dir
  4. apply the temporary musl shim only in native mode
  5. ensure a .clangd config exists at the source root (libcxx include
     path + musl sysroot include order; see ensure_clangd_config)
  6. stream-partition the compile database; run N clangd instances in
     parallel, all writing shards into one index dir (atomic temp+rename)
  7. clean up the slice work dirs, keeping the small instance logs
  8. print a summary

Portable mode writes <out_dir>/lsp-portable/.cache/clangd/index inside a
private fixed-root mount namespace. Native mode retains the original
<out_dir>/.cache/clangd/index layout. Both support incremental indexing.
"""

import argparse
import glob
import json
import os
import re
import shutil
import subprocess
import sys
import time
import zlib
from pathlib import Path
from portable_index import prepare, finish, local_path

HERE = os.path.dirname(os.path.abspath(__file__))
TOOLS_DIR = os.path.join(HERE, "..", "..", "..", "..", "..")  # -> source root


def find_root():
    """Locate the OHOS source root above this script.

    The script lives at <root>/developtools/integration_verification/tools/
    oskm/lsp/, so the root is five levels up. Verify with several layout
    markers so the check survives renames of any single entry file.
    """
    root = os.path.normpath(TOOLS_DIR)
    markers = [
        os.path.isfile(os.path.join(root, "build.sh")),
        os.path.isfile(os.path.join(root, "build.py")),
        os.path.isdir(os.path.join(root, "developtools"))
        and os.path.isdir(os.path.join(root, "prebuilts")),
    ]
    if not any(markers):
        return None
    return root


def find_clangd(root):
    candidates = []
    env = os.environ.get("LSP_CLANGD_BIN")
    if env:
        candidates.append(env)
    bundled = os.path.join(HERE, "clangd", "bin", "clangd")
    if os.path.isfile(bundled):
        candidates.append(bundled)
    found = shutil.which("clangd")
    if found:
        candidates.append(found)
    prebuilt = glob.glob(os.path.join(
        root, "prebuilts", "clang", "ohos", "*", "llvm", "bin", "clangd"))
    candidates.extend(prebuilt)
    for cand in candidates:
        if _is_executable_binary(cand):
            return cand
    return None


def _is_executable_binary(path):
    """Check that a path is a real executable binary, not an LFS pointer."""
    if not os.path.isfile(path) or not os.access(path, os.X_OK):
        return False
    try:
        with open(path, "rb") as f:
            magic = f.read(4)
    except OSError:
        return False
    # ELF magic: \x7fELF; also allow "#!/usr/bin/env" scripts
    return magic == b"\x7fELF" or magic.startswith(b"#!")


def clangd_version(clangd_bin):
    try:
        out = subprocess.run([clangd_bin, "--version"], capture_output=True,
                             text=True, timeout=30).stdout
        m = re.search(r"clangd version (\d+)", out)
        return int(m.group(1)) if m else 0
    except Exception:
        return 0


def _clangd_config_isystem_dead(path, base_dir):
    """True when the existing .clangd aims an -I or -isystem at a path that
    is missing on this machine (e.g. the file was generated on another host
    and shipped over). Relative paths are resolved against base_dir (the
    directory the compile commands run from), not the process cwd."""
    try:
        with open(path) as f:
            lines = f.read().splitlines()
    except OSError:
        return False
    for i, line in enumerate(lines):
        stripped = line.strip()
        if stripped in ("- -isystem", "- -I") and i + 1 < len(lines):
            target = lines[i + 1].strip().lstrip("-").strip()
            if not target:
                continue
            if not os.path.isabs(target):
                target = os.path.normpath(os.path.join(base_dir, target))
            if not os.path.exists(target):
                return True
    return False


def _clangd_config_pre_reorder(path):
    """True when an existing .clangd predates the include-order fix: libcxx
    sits at the back of the search (-isystem, no -nostdinc++), the layout
    under which clangd's sysroot expansion lets musl's stddef.h hijack
    every libc++ #include_next chain."""
    try:
        with open(path) as f:
            text = f.read()
    except OSError:
        return False
    return "- -isystem" in text and "-nostdinc++" not in text


def _cdb_sysroot_target(out_dir):
    """Extract the sysroot and target triple recorded in the compile
    database head (GN commands are uniform, so the head is representative).

    Returns (sysroot_flag, sysroot, target):
      * sysroot_flag: the Remove entry exactly as the flag appears in the
        commands ("-sysroot=obj/third_party/musl" for the joined form, the
        bare flag name for the space-separated form), or None
      * sysroot: the sysroot path as recorded (kept relative when the
        command spells it relative, so the config stays relocatable), or
        None
      * target: the target triple, or None
    """
    try:
        with open(os.path.join(out_dir, "compile_commands.json"),
                  "r", encoding="utf-8", errors="replace") as f:
            head = f.read(1 << 20)
    except OSError:
        return None, None, None
    sysroot_flag = None
    sysroot = None
    m = re.search(r"(-{1,2}i?sysroot=[^\s\"']+)", head)
    if m:
        sysroot_flag = m.group(1)
        sysroot = m.group(1).split("=", 1)[1]
    else:
        m = re.search(r"\s(-{1,2}i?sysroot)[ \t]+[^\s\"']+", head)
        if m:
            sysroot_flag = m.group(1)
            sysroot = m.group(0).split(None, 1)[1].strip()
    target = None
    m = re.search(r"-{1,2}target[= ]([^\s\"']+)", head)
    if m:
        target = m.group(1)
    return sysroot_flag, sysroot, target


def _pick_libcxx(root, out_dir):
    """Pick the libcxx-ohos include directory matching the toolchain the
    compile commands actually use, falling back to any linux toolchain.

    glob order is arbitrary, which is how a windows-x86_64 path ended up
    on linux hosts in the first place.
    """
    candidates = sorted(glob.glob(os.path.join(
        root, "prebuilts", "clang", "ohos", "*", "llvm", "include",
        "libcxx-ohos", "include", "c++", "v1")))
    if not candidates:
        return None

    def platform(path):
        parts = os.path.normpath(path).split(os.sep)
        if "ohos" in parts:
            i = parts.index("ohos")
            if i + 1 < len(parts):
                return parts[i + 1]
        return ""

    wanted = ""
    if out_dir:
        try:
            with open(os.path.join(out_dir, "compile_commands.json"),
                      "r", encoding="utf-8", errors="replace") as f:
                head = f.read(1 << 20)
            match = re.search(
                r"prebuilts[/\\]clang[/\\]ohos[/\\]([^/\\\s\"']+)", head)
            if match:
                wanted = match.group(1)
        except OSError:
            pass
    if wanted:
        for cand in candidates:
            if platform(cand) == wanted:
                return cand
    for cand in candidates:
        if platform(cand).startswith("linux"):
            return cand
    return candidates[0]


def ensure_clangd_config(root, out_dir=None):
    """Write a .clangd at the source root if none exists (or is stale).

    The libcxx-ohos include path is not part of the compile commands (the
    OHOS clang driver adds it implicitly), so clangd needs it via config.
    The include is written relative to the out dir (compile commands run
    from there), which keeps the file relocatable across machines.

    When the compile commands carry a musl sysroot, the config additionally
    fixes the include order. clangd expands the sysroot where the flag sits
    in argv (early, ahead of every -I), so musl's <stddef.h> wins over
    libc++'s own wrapper on every #include_next and C++ TUs degrade with
    the "no member named 'nullptr_t' in the global namespace" cascade (the
    problem apply_musl_fix.py shims around during index builds). The fix
    drops the sysroot flag, puts libcxx-ohos in the user group (-I, always
    searched first) and re-adds the musl directories at the back (-isystem)
    — the order the real clang driver computes. Unlike the shim it also
    covers interactive clangd sessions, which run long after the shim has
    been reverted out of the build output.

    An existing config is regenerated when one of its -I/-isystem targets
    is missing on this machine, or when it predates the reorder while the
    sysroot reorder is derivable from the compile database; otherwise it
    is left untouched.
    """
    path = os.path.join(root, ".clangd")
    out_dir = out_dir or root
    sysroot_flag, sysroot, target = _cdb_sysroot_target(out_dir)
    reorder = bool(sysroot_flag and sysroot and target)
    if os.path.exists(path):
        stale = _clangd_config_isystem_dead(path, out_dir)
        outdated = reorder and _clangd_config_pre_reorder(path)
        if not stale and not outdated:
            return "exists (left untouched)"

    libcxx = _pick_libcxx(root, out_dir)
    if libcxx is None:
        return "SKIPPED (libcxx-ohos not found; C++ indexing may degrade)"
    include = os.path.relpath(libcxx, out_dir)

    add_flags = [
        "-Wno-unknown-warning-option",
        "-Wno-unknown-attributes",
    ]
    remove_flags = [
        "-enable-trivial-auto-var-init-zero-knowing-it-will-be-removed-from-clang",
        "-fstack-protector-ret-strong",
        "-fcfi-trap-function=__cfi_fail_report",
    ]
    if reorder:
        add_flags += [
            "-nostdinc++",
            "-I", include,
            "-isystem", os.path.join(sysroot, "usr", "include", target),
            "-isystem", os.path.join(sysroot, "usr", "include"),
        ]
        remove_flags = [sysroot_flag] + remove_flags
    else:
        add_flags += ["-isystem", include]

    lines = [
        "Index:",
        "  Background: Build",
        "  StandardLibrary: Yes",
        "",
        "CompileFlags:",
        "  Add:",
    ]
    for flag in add_flags:
        lines.append("    - " + flag)
    lines.append("  Remove:")
    for flag in remove_flags:
        lines.append("    - " + flag)
    lines += [
        "",
        "Diagnostics:",
        "  ClangTidy:",
        '    Checks: "-*"',
        "  UnusedIncludes: None",
        "  MissingIncludes: None",
        "",
    ]
    with open(path, "w", encoding="utf-8") as f:
        f.write("\n".join(lines))
    if reorder:
        return "generated (include order fixed: libcxx first, musl last)"
    return "generated"


def _cgroup_file(*paths):
    for path in paths:
        try:
            with open(path) as f:
                value = f.read().strip()
            if value:
                return value
        except OSError:
            continue
    return None


def cgroup_memory_limit_bytes():
    """Closest cgroup memory limit, or None when unlimited/unreadable.

    /proc/meminfo reports host-wide values inside containers, so the pod
    limit is the real ceiling. Covers cgroup v2 (memory.max) and v1
    (memory/memory.limit_in_bytes); "max" and absurdly large sentinels
    mean unlimited.
    """
    raw = _cgroup_file("/sys/fs/cgroup/memory.max",
                       "/sys/fs/cgroup/memory/memory.limit_in_bytes")
    if raw is None or raw == "max":
        return None
    try:
        value = int(raw)
    except ValueError:
        return None
    if value <= 0 or value >= (1 << 45):
        return None
    return value


def cgroup_memory_usage_bytes():
    """Current cgroup memory usage minus reclaimable page cache.

    memory.usage_in_bytes / memory.current count the page cache, which
    the kernel reclaims under pressure, so the working-set style figure
    (usage minus file cache) is the honest consumed amount for planning.
    """
    raw = _cgroup_file("/sys/fs/cgroup/memory.current",
                       "/sys/fs/cgroup/memory/memory.usage_in_bytes")
    if not raw:
        return None
    try:
        usage = int(raw)
    except ValueError:
        return None
    stat = _cgroup_file("/sys/fs/cgroup/memory.stat",
                        "/sys/fs/cgroup/memory/memory.stat")
    if stat:
        cache = 0
        for line in stat.splitlines():
            fields = line.split()
            if len(fields) == 2 and fields[0] in (
                    "file", "total_cache", "cache"):
                try:
                    cache = max(cache, int(fields[1]))
                except ValueError:
                    continue
        if cache:
            return max(0, usage - cache)
    return usage


def effective_cpu_count():
    """CPU count after the cgroup CFS quota (containers see host CPUs)."""
    raw = os.cpu_count() or 8
    v2 = _cgroup_file("/sys/fs/cgroup/cpu.max")
    if v2:
        fields = v2.split()
        if len(fields) == 2 and fields[0] not in ("max", "-1"):
            try:
                quota, period = int(fields[0]), int(fields[1])
            except ValueError:
                return raw
            if quota > 0 and period > 0:
                return max(1, min(raw, quota // period))
    quota = _cgroup_file("/sys/fs/cgroup/cpu/cpu.cfs_quota_us")
    period = _cgroup_file("/sys/fs/cgroup/cpu/cpu.cfs_period_us")
    try:
        if quota and period and quota not in ("-1", "max"):
            value = int(int(quota) / int(period))
            if value > 0:
                return max(1, min(raw, value))
    except ValueError:
        pass
    return raw


def _looks_like_container():
    """Best-effort container detection (docker/podman/k8s/lxc)."""
    if os.path.exists("/.dockerenv") or os.path.exists("/run/.containerenv"):
        return True
    try:
        with open("/proc/1/cgroup") as f:
            content = f.read()
    except OSError:
        content = ""
    return any(k in content for k in
               ("kubepods", "docker", "containerd", "lxc", "machine-runc"))


def memory_info_trusted():
    """True when the memory numbers are trustworthy for planning.

    Untrusted inside a container whose cgroup limit/usage cannot be read:
    /proc/meminfo then reports the host-wide free memory, which is not
    what this container may actually consume.
    """
    if cgroup_memory_limit_bytes():
        return cgroup_memory_usage_bytes() is not None
    return not _looks_like_container()


def plan_parallelism(instances_arg, jobs_arg, cpu, avail_gb, trusted, cdb_gb):
    """Decide (instances, jobs, pch) from measured resources.

    Budget model (calibrated on a full wukong100 build on a 48 GB pod):
    a parse worker takes ~0.55 GB with in-memory PCH and ~0.30 GB with
    disk PCH, each instance holds ~3.5 GB on top of its workers (slice
    CDB plus the growing merged index), and the parent peaks at ~5x the
    CDB size while partitioning. 70% of the available memory is spent.

    The PCH placement adapts to the resource profile: when memory is
    plentiful the memory-PCH plan already saturates the CPU and stays
    fastest per parse (big build hosts keep their historical behavior);
    when memory is the binding constraint, disk PCH roughly halves the
    per-worker cost and buys extra workers.

    When the memory numbers cannot be trusted, fall back to a
    conservative default of 2 disk-PCH workers rather than
    over-committing. Explicit --instances/--jobs-per-instance always win.
    """
    if not trusted:
        instances = instances_arg or 1
        jobs = jobs_arg or 2
        print("[lsp] memory detection unavailable inside this container "
              "(host view shows {:.1f} GB, not trustworthy); conservative "
              "default: {} instances x {} jobs = {} workers (disk pch)".format(
                  avail_gb, instances, jobs, instances * jobs))
        return instances, jobs, "disk"
    budget_gb = avail_gb * 0.7

    def _budget(inst, per_worker):
        fixed = cdb_gb * 5 + inst * 3.5 + 1.0
        return fixed, max(1, min(cpu, int((budget_gb - fixed) / per_worker)))

    instances = instances_arg or (4 if cpu >= 48 else 2 if cpu >= 24 else 1)
    fixed, w_mem = _budget(instances, 0.55)
    _, w_disk = _budget(instances, 0.30)
    if instances > 1 and min(w_mem, w_disk) < instances:
        print("[lsp] low free RAM (available {:.1f} GB); falling back to 1 "
              "instance (no CDB slice)".format(avail_gb))
        instances = 1
        fixed, w_mem = _budget(1, 0.55)
        _, w_disk = _budget(1, 0.30)
    if w_mem >= cpu:
        pch, total_jobs, worker_cost = "memory", w_mem, 0.55
    elif w_disk > w_mem:
        pch, total_jobs, worker_cost = "disk", w_disk, 0.30
    else:
        pch, total_jobs, worker_cost = "memory", w_mem, 0.55
    jobs = jobs_arg or max(1, min(60, total_jobs // instances))
    print("[lsp] resources: effective cpu {}, available memory {:.1f} GB "
          "(using {:.1f} GB); plan: {} instances x {} jobs = {} workers, "
          "pch={} (est. {:.1f} GB)".format(
              cpu, avail_gb, budget_gb, instances, jobs,
              instances * jobs, pch,
              fixed + instances * jobs * worker_cost))
    return instances, jobs, pch


def mem_available_gb():
    """Best-effort available RAM in GB, cgroup-aware.

    Falls back to /proc/meminfo (host view) when the cgroup limit or
    usage cannot be read; inside containers the cgroup headroom
    (limit minus usage) is the trustworthy number.
    """
    try:
        with open("/proc/meminfo") as f:
            for line in f:
                if line.startswith("MemAvailable:"):
                    avail = int(line.split()[1]) / (1 << 20)
                    break
            else:
                avail = 16.0
    except OSError:
        avail = 16.0
    limit = cgroup_memory_limit_bytes()
    usage = cgroup_memory_usage_bytes()
    if limit and usage is not None:
        headroom = (limit - usage) / (1 << 30)
        if headroom < avail:
            return max(0.0, headroom)
    return avail


def partition_cdb(cdb_path, n, work_dir, index_dir):
    """Split compile_commands.json into n slice files.

    Fast path loads the whole CDB with json (needs roughly 5x file size of
    RAM); the streaming fallback is memory-flat but slow and is only used
    when RAM is tight. Entries are routed by crc32 of the "file" field so
    all entries of one source file land in one slice.
    Returns ([(slice_cdb, kickoff_abs_path, entry_count), ...], total).
    """
    size_gb = os.path.getsize(cdb_path) / (1 << 30)
    use_json = mem_available_gb() > size_gb * 6 + 4
    for i in range(n):
        os.makedirs(os.path.join(work_dir, str(i), ".cache", "clangd"),
                    exist_ok=True)
        link = os.path.join(work_dir, str(i), ".cache", "clangd", "index")
        target = os.path.relpath(index_dir, os.path.dirname(link))
        if not os.path.lexists(link):
            os.symlink(target, link)
        elif os.path.islink(link) and os.readlink(link) != target:
            temporary = link + ".tmp-{}".format(os.getpid())
            os.symlink(target, temporary)
            os.replace(temporary, link)

    if use_json:
        with open(cdb_path, "r", encoding="utf-8") as f:
            entries = json.load(f)
        groups = [[] for _ in range(n)]
        for e in entries:
            groups[zlib.crc32(e["file"].encode("utf-8")) % n].append(e)
        result = []
        for i, group in enumerate(groups):
            cdb = os.path.join(work_dir, str(i), "compile_commands.json")
            with open(cdb, "w", encoding="utf-8") as f:
                json.dump(group, f)
            first = None
            if group:
                first = os.path.normpath(os.path.join(
                    group[0]["directory"], group[0]["file"]))
            result.append((cdb, first, len(group)))
        return result, len(entries)

    # Streaming fallback: memory-flat, char-by-char state machine.
    slices = []
    for i in range(n):
        cdb = os.path.join(work_dir, str(i), "compile_commands.json")
        slices.append({"fh": open(cdb, "w", encoding="utf-8"),
                       "cdb": cdb, "count": 0, "first": None})
    for s in slices:
        s["fh"].write("[")
    in_string = escape = False
    depth = 0
    entry = []
    total = 0
    with open(cdb_path, "r", encoding="utf-8") as f:
        while True:
            chunk = f.read(1 << 22)
            if not chunk:
                break
            for ch in chunk:
                if depth == 0:
                    if ch == "{":
                        depth = 1
                        entry = ["{"]
                    continue
                entry.append(ch)
                if in_string:
                    if escape:
                        escape = False
                    elif ch == "\\":
                        escape = True
                    elif ch == '"':
                        in_string = False
                    continue
                if ch == '"':
                    in_string = True
                elif ch == "{":
                    depth += 1
                elif ch == "}":
                    depth -= 1
                    if depth == 0:
                        text = "".join(entry)
                        try:
                            obj = json.loads(text)
                        except ValueError:
                            obj = {}
                        key = obj.get("file", "")
                        idx = zlib.crc32(key.encode("utf-8")) % n if key else 0
                        s = slices[idx]
                        if s["count"] > 0:
                            s["fh"].write(", ")
                        s["fh"].write(text)
                        s["count"] += 1
                        if s["first"] is None and key:
                            s["first"] = os.path.normpath(os.path.join(
                                obj.get("directory", ""), key))
                        total += 1
    result = []
    for s in slices:
        s["fh"].write("]")
        s["fh"].close()
        result.append((s["cdb"], s["first"], s["count"]))
    return result, total


def ensure_mcp_config(root, out_dir, clangd_bin, kickoff=None, portable_artifact=None):
    """Generate the consumer-side MCP config and symlink it to the root.

    Writes oskm/lsp/lsp-mcp.json from the actual build parameters (product
    out dir, the clangd_wrapper.py launcher, a real kickoff file from the
    CDB), then symlinks <root>/.lsp-mcp.json to it so consumers need no
    manual setup. Portable indices use the wrapper's private mount namespace;
    native indices remain specific to the original workspace. All generated
    paths are relative to the source root: the root config
    is only discovered when the MCP is launched from the source root, so
    relative paths are always self-consistent and the whole tree stays
    relocatable. An existing regular file at the root is left untouched
    (user-managed). Returns a status string.
    """
    here_rel = os.path.relpath(HERE, root)
    config_path = os.path.join(HERE, "lsp-mcp.json")
    wrapper_rel = os.path.relpath(os.path.join(HERE, "clangd_wrapper.py"), root)
    try:
        os.chmod(os.path.join(HERE, "clangd_wrapper.py"), 0o755)
    except OSError:
        pass
    out_rel = os.path.relpath(portable_artifact or out_dir, root)
    warmup_rel = None
    if kickoff and os.path.isfile(kickoff):
        warmup_rel = os.path.relpath(kickoff, root)
    config = {
        "servers": [{
            "id": "cpp",
            "extensions": [".c", ".h", ".cpp", ".hpp", ".cc", ".hh",
                           ".cxx", ".hxx", ".c++", ".h++"],
            "languageIds": ["c", "cpp"],
            "command": wrapper_rel,
            "args": [
                "--background-index",
                "--compile-commands-dir=" + out_rel,
                "-j=8",
                "--pch-storage=disk",
                "--limit-references=0",
                "--limit-results=0",
            ],
            "env": {"LSP_CLANGD_BIN": os.path.relpath(clangd_bin, root)},
            "rootPatterns": [".repo"],
            "warmup": warmup_rel,
        }],
        "requestTimeout": 600000,
        "autoStart": True,
        "idleTimeout": 28800000,
        "logLevel": "info",
    }
    server = config["servers"][0]
    if not server["warmup"]:
        del server["warmup"]
    with open(config_path, "w", encoding="utf-8") as f:
        json.dump(config, f, indent=2, ensure_ascii=False)
        f.write("\n")

    link = os.path.join(root, ".lsp-mcp.json")
    target_rel = os.path.join(here_rel, "lsp-mcp.json")
    if os.path.islink(link):
        os.unlink(link)
        os.symlink(target_rel, link)
        return "symlink refreshed -> {}".format(target_rel)
    if os.path.exists(link):
        return "generated {} but root .lsp-mcp.json exists (left untouched)".format(
            target_rel)
    os.symlink(target_rel, link)
    return "symlinked <root>/.lsp-mcp.json -> {}".format(target_rel)


def ensure_cdb(out_dir, root):
    """Return (cdb_path, status); generate the CDB if it is missing.

    The normal path is the compile_commands.json produced by the OHOS build
    itself. When absent (e.g. a build variant that skips it), fall back to
    ``ninja -w dupbuild=warn -t compdb`` — the warning flag tolerates the
    duplicate build targets common in OHOS builds (phony stamp aliases) so
    ninja still emits a full, exact CDB. If ninja fails for any other
    reason, fall back to a custom parser that reads .ninja files directly
    and extracts compile commands.
    """
    cdb = os.path.join(out_dir, "compile_commands.json")
    if os.path.isfile(cdb):
        return cdb, "exists"
    build_ninja = os.path.join(out_dir, "build.ninja")
    if not os.path.isfile(build_ninja):
        return None, "missing and no build.ninja to generate from"
    ninja = shutil.which("ninja")
    if not ninja:
        cand = glob.glob(os.path.join(root, "prebuilts", "build-tools",
                                       "*", "bin", "ninja"))
        ninja = cand[0] if cand else None
    if not ninja:
        return None, "missing and ninja not found"
    rules = ["cxx", "cc", "objc", "objcxx", "asm"]
    tmp = cdb + ".gen-tmp"
    with open(tmp, "w", encoding="utf-8") as f:
        rc = subprocess.run(
            [ninja, "-C", out_dir, "-w", "dupbuild=warn",
             "-t", "compdb"] + rules,
            stdout=f, stderr=subprocess.DEVNULL).returncode
    if rc == 0 and os.path.isfile(tmp) and os.path.getsize(tmp) >= 1024:
        os.replace(tmp, cdb)
        return cdb, "generated via ninja -t compdb"
    if os.path.isfile(tmp):
        os.remove(tmp)
    print("[lsp] ninja -t compdb failed (exit {}), "
          "falling back to direct .ninja parser".format(rc))
    entries = _parse_ninja_compile_commands(out_dir, rules)
    if not entries:
        return None, "generation failed (ninja error + parser found nothing)"
    with open(tmp, "w", encoding="utf-8") as f:
        json.dump(entries, f)
    if os.path.getsize(tmp) < 1024:
        os.remove(tmp)
        return None, "parser output too small"
    os.replace(tmp, cdb)
    return cdb, "generated via direct .ninja parser ({} " \
           "entries)".format(len(entries))


def _parse_ninja_compile_commands(out_dir, rules):
    """Parse .ninja files directly to extract compile commands.

    Reads build.ninja, toolchain.ninja and all obj/*.ninja subninja files,
    finds ``build X.o: cxx source.cpp`` edges, and converts each into a
    compile_commands.json entry. Duplicate outputs are skipped (first wins).
    """
    rule_set = set(rules)
    entries = []
    seen = set()
    ninja_files = [os.path.join(out_dir, "build.ninja"),
                   os.path.join(out_dir, "toolchain.ninja")]
    ninja_files += glob.glob(os.path.join(out_dir, "obj", "**",
                                          "*.ninja"), recursive=True)
    for nf_path in ninja_files:
        if not os.path.isfile(nf_path):
            continue
        try:
            with open(nf_path, encoding="utf-8",
                      errors="replace") as f:
                lines = f.readlines()
        except OSError:
            continue
        for line in lines:
            stripped = line.strip()
            m = re.match(r'^build (\S+\.o): (\S+) (.+)$', stripped)
            if not m or m.group(2) not in rule_set:
                continue
            output = m.group(1)
            if output in seen:
                continue
            seen.add(output)
            rest = m.group(3)
            rest = re.split(r'\s*\|\|?\s*', rest)[0].strip()
            src_m = re.search(
                r'(\S+\.(?:c|cc|cpp|cxx|s|S|m|mm))\s*$', rest)
            if not src_m:
                continue
            src = src_m.group(1)
            if not src.startswith('/'):
                src = os.path.normpath(
                    os.path.join(out_dir, src))
            entries.append({
                "directory": out_dir,
                "file": src,
                "output": output,
                "command": stripped,
            })
    return entries


def _report_revert(results):
    print("[lsp] musl fix reverted: {}".format(
        ", ".join("{}: {}".format(os.path.basename(os.path.dirname(p)), s)
                  for p, s in results) or "no musl sysroot found"))


MAIN_SHARD_RE = re.compile(
    r"\.(?:cpp|cxx|cc|c|C|s|S|m|mm)\.[0-9A-F]{16}\.idx$")
CDB_FILE_KEY = b'"file":'


def count_main_shards(index_dir):
    """Main-file shards in the index, or -1 when unreadable."""
    try:
        return sum(1 for name in os.listdir(index_dir)
                   if MAIN_SHARD_RE.search(name))
    except OSError:
        return -1


def count_cdb_entries(cdb_path):
    """Entry count of a compile database, or -1 when unreadable.

    Streams the file counting '"file":' key occurrences; pretty-printed
    and minified layouts both match.
    """
    total = 0
    carry = b""
    try:
        with open(cdb_path, "rb") as f:
            while True:
                chunk = f.read(8 << 20)
                if not chunk:
                    break
                buf = carry + chunk
                cut = len(buf) - len(CDB_FILE_KEY) + 1
                if cut > 0:
                    total += buf[:cut].count(CDB_FILE_KEY)
                    carry = buf[cut:]
                else:
                    carry = buf
    except OSError:
        return -1
    return total + carry.count(CDB_FILE_KEY)


def main():
    try:
        sys.stdout.reconfigure(line_buffering=True)
    except (AttributeError, ValueError):
        pass
    parser = argparse.ArgumentParser(
        description="Build the clangd background index for an OHOS build.")
    parser.add_argument("-i", "--input", required=True,
                        help="build output directory, e.g. out/rk3568")
    parser.add_argument("--instances", type=int, default=0,
                        help="parallel clangd instances (0 = auto)")
    parser.add_argument("--jobs-per-instance", type=int, default=0,
                        help="clangd workers per instance (0 = auto)")
    parser.add_argument("--timeout-hours", type=float, default=0,
                        help="abort after N hours (0 = unlimited; "
                             "partial progress is kept and resumed next run)")
    parser.add_argument("--cdb-filter", choices=["testfuzz", "off"],
                        default="testfuzz",
                        help="trim compile_commands.json before indexing: "
                             "drop test/fuzz entries that were never built "
                             "and keep one command per source file "
                             "(off = keep the full build graph)")
    parser.add_argument("--dry-run", action="store_true",
                        help="print the plan and checks without building")
    parser.add_argument("--index-mode", choices=["portable", "native"], default="portable",
                        help="portable uses a private fixed-root mount (requires bwrap)")
    args = parser.parse_args()

    root = find_root()
    if not root:
        print("[lsp] cannot locate source root from {}".format(HERE))
        return 1
    out_dir = os.path.abspath(args.input)
    if not os.path.isdir(out_dir):
        candidate = os.path.normpath(os.path.join(root, args.input))
        if os.path.isdir(candidate):
            out_dir = candidate

    if args.dry_run:
        cdb = os.path.join(out_dir, "compile_commands.json")
        cdb_note = ("exists" if os.path.isfile(cdb)
                    else "absent -> would generate via ninja -t compdb")
        clangd_bin = find_clangd(root)
        ver = clangd_version(clangd_bin) if clangd_bin else 0
        print("[lsp] root: {}".format(root))
        print("[lsp] out:  {}".format(out_dir))
        print("[lsp] cdb:  {}".format(cdb_note))
        print("[lsp] clangd: {} (version {})".format(clangd_bin, ver or "?"))
        print("[lsp] (dry-run) would launch instances and generate mcp config")
        return 0

    cdb, cdb_status = ensure_cdb(out_dir, root)
    if not cdb:
        print("[lsp] compile_commands.json unavailable: {}".format(cdb_status))
        return 1
    index_dir = os.path.join(out_dir, ".cache", "clangd", "index")
    os.makedirs(index_dir, exist_ok=True)
    print("[lsp] cdb: {}".format(cdb_status))

    if args.cdb_filter != "off":
        from cdb_trim import trim_if_stale
        stats = trim_if_stale(cdb, out_dir)
        if stats:
            print("[lsp] cdb trimmed: {} -> {} entries "
                  "(test/fuzz: -{}, duplicates: -{})".format(
                      stats["total"], stats["kept"],
                      stats["test"], stats["dup"]))
        else:
            print("[lsp] cdb trim: skipped (already trimmed or "
                  "unsupported layout)")

    clangd_bin = find_clangd(root)
    if not clangd_bin:
        print("[lsp] no clangd found (set LSP_CLANGD_BIN, bundle one at "
              "oskm/lsp/clangd/, or install clangd >= 20 in PATH)")
        return 1
    ver = clangd_version(clangd_bin)
    ver_note = ""
    if ver and ver < 20:
        ver_note = ("WARNING: clangd {} < 20: outgoingCalls unsupported, "
                    "C++ index quality degraded".format(ver))

    cpu = effective_cpu_count()
    avail_gb = mem_available_gb()
    cdb_gb = os.path.getsize(cdb) / (1 << 30)
    instances, jobs, pch = plan_parallelism(
        args.instances, args.jobs_per_instance, cpu, avail_gb,
        memory_info_trusted(), cdb_gb)

    from apply_musl_fix import apply_musl_fix, revert_musl_fix
    musl_results = apply_musl_fix(out_dir) if args.index_mode == "native" else []
    clangd_cfg = ensure_clangd_config(root, out_dir)
    portable = None
    if args.index_mode == "portable":
        portable = prepare(root, cdb, os.path.join(out_dir, "lsp-portable"),
                           clangd_bin, os.path.relpath(out_dir, root))
        cdb = str(portable / "compile_commands.json")
        index_dir = str(portable / ".cache" / "clangd" / "index")
        os.makedirs(index_dir, exist_ok=True)

    print("[lsp] root: {}".format(root))
    print("[lsp] out:  {}".format(out_dir))
    print("[lsp] clangd: {} (version {})".format(clangd_bin, ver or "?"))
    if ver_note:
        print("[lsp] " + ver_note)
    print("[lsp] instances={} jobs/instance={}".format(instances, jobs))
    print("[lsp] musl fix: {}".format(
        ", ".join("{}: {}".format(os.path.basename(os.path.dirname(p)), s)
                  for p, s in musl_results) or "no musl sysroot found"))
    print("[lsp] .clangd: {}".format(clangd_cfg))
    print("[lsp] index: {}".format(index_dir))

    work_dir = os.path.join(out_dir, ".clangd-lsp-work")
    os.makedirs(work_dir, exist_ok=True)
    t0 = time.time()
    if instances == 1:
        slices = [(cdb, None, -1)]
        kickoffs = []
        with open(cdb, "r", encoding="utf-8") as f:
            head = f.read(1 << 20)
        m = re.search(r'"file":\s*"([^"]+)"', head)
        dirm = re.search(r'"directory":\s*"([^"]+)"', head)
        if m and dirm:
            kickoffs.append(os.path.normpath(
                os.path.join(dirm.group(1), m.group(1))))
    else:
        slices, total = partition_cdb(cdb, instances, work_dir, index_dir)
        kickoffs = [s[1] for s in slices]
        print("[lsp] CDB partitioned: {} entries -> {} slices".format(
            total, instances))
    if not kickoffs or not kickoffs[0]:
        with open(cdb, "r", encoding="utf-8") as f:
            head = f.read(1 << 20)
        m = re.search(r'"file":\s*"([^"]+)"', head)
        dirm = re.search(r'"directory":\s*"([^"]+)"', head)
        if m and dirm:
            kickoffs = [os.path.normpath(os.path.join(dirm.group(1),
                                                      m.group(1)))]
    if not kickoffs or not kickoffs[0]:
        print("[lsp] cannot determine a kickoff file from the CDB")
        if portable:
            finish(portable, False)
        if args.index_mode == "native":
            _report_revert(revert_musl_fix(out_dir))
        return 1
    kickoffs = [k or kickoffs[0] for k in kickoffs]
    kickoffs = [local_path(k, root) for k in kickoffs]

    procs = []
    for i in range(instances):
        cdb_dir = os.path.dirname(slices[i][0])
        env = dict(os.environ,
                   OH_ROOT=root,
                   CDB_DIR=cdb_dir,
                   CLANGD_BIN=clangd_bin,
                   CLANGD_JOBS=str(jobs),
                   CLANGD_PCH=pch,
                   LSP_PORTABLE_ARTIFACT=str(portable) if portable else "",
                   KICKOFF_FILE=kickoffs[i] if instances > 1 else kickoffs[0])
        log = open(os.path.join(work_dir, "instance-{}.log".format(i)), "w")
        procs.append(subprocess.Popen(
            [sys.executable, os.path.join(HERE, "clangd_tools.py"), "warm",
             os.environ.get("LSP_INDEX_INTERVAL", "60")],
            cwd=root, env=env, stdout=log, stderr=subprocess.STDOUT,
            start_new_session=True))
        log.close()
        print("[lsp] instance {} started (cdb slice: {}, log: {}/instance-{}.log)"
              .format(i, cdb_dir, work_dir, i))

    deadline = time.time() + args.timeout_hours * 3600 if args.timeout_hours else 0
    timed_out = False
    try:
        for i, p in enumerate(procs):
            remaining = None
            if deadline:
                remaining = max(1, int(deadline - time.time()))
            try:
                p.wait(timeout=remaining)
            except subprocess.TimeoutExpired:
                print("[lsp] timeout reached; terminating instances "
                      "(progress kept, resumed next run)")
                timed_out = True
                break
    finally:
        import signal
        for p in procs:
            try:
                os.killpg(p.pid, signal.SIGTERM)
            except ProcessLookupError:
                pass
        for p in procs:
            try:
                p.wait(timeout=10)
            except subprocess.TimeoutExpired:
                os.killpg(p.pid, signal.SIGKILL)
                p.wait()

    failed = [(i, p.returncode) for i, p in enumerate(procs)
              if p.returncode not in (0, None, -15)]
    for i, code in failed:
        print("[lsp] WARNING: instance {} exited with code {} "
              "(its share of the index is INCOMPLETE)".format(i, code))

    mains = count_main_shards(index_dir)
    entries = count_cdb_entries(cdb)
    incomplete = bool(failed) or timed_out
    if mains >= 0 and entries > 0 and mains < entries * 0.9:
        incomplete = True
        print("[lsp] WARNING: only {} main-file shards for {} CDB "
              "entries (index INCOMPLETE)".format(mains, entries))
    elif mains >= 0 and entries > 0:
        print("[lsp] index coverage: {} main-file shards for {} CDB "
              "entries".format(mains, entries))

    if instances > 1:
        for i in range(instances):
            shutil.rmtree(os.path.join(work_dir, str(i)), ignore_errors=True)
        print("[lsp] work slices cleaned (instance logs kept: {})"
              .format(work_dir))

    import glob as _glob
    shards = len(_glob.glob(os.path.join(index_dir, "*.idx")))
    print("[lsp] done in {:.0f}s: {} shards in {}{}".format(
        time.time() - t0, shards, index_dir,
        " (INCOMPLETE)" if incomplete else ""))

    if portable:
        finish(portable, not incomplete)
    mcp_status = ensure_mcp_config(root, out_dir, clangd_bin,
                                  kickoff=kickoffs[0], portable_artifact=portable)
    print("[lsp] mcp config: {}".format(mcp_status))
    if args.index_mode == "native":
        _report_revert(revert_musl_fix(out_dir))
    return 1 if incomplete else 0


if __name__ == "__main__":
    raise SystemExit(main())
