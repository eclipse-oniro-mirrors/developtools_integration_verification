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

"""Trim a compile database for LSP consumption (pipeline side).

The OHOS build emits one entry per ninja edge: the same source file
appears once per target variant, and roughly one entry in six is a
test/fuzz target the product never linked. Both are waste for clangd:
it resolves an opened file with the first matching command, and the
background index re-parses a source once per entry. Trimming the CDB
before build_index.py partitions it shrinks the shipped CDB, the
index build time, and the consumer's memory by roughly 4x.

Rules:
  * drop test/fuzz entries (path-shape heuristic) unless the recorded
    output .o exists — entries the product actually built are kept
  * keep the first command per source file, drop the duplicates

The pass is streaming (memory-flat), atomic (tmp + rename), and
idempotent: trimming an already-trimmed CDB changes nothing, and a
fresh marker (out_dir/.cdb-trimmed) avoids re-streaming a 4 GB file
on incremental runs until the build regenerates it.
"""

import json
import os
import re

FILE_RE = re.compile(rb'"file"\s*:\s*"((?:[^"\\]|\\.)*)"')
OUT_RE = re.compile(rb'"output"\s*:\s*"((?:[^"\\]|\\.)*)"')
DIR_RE = re.compile(rb'"directory"\s*:\s*"((?:[^"\\]|\\.)*)"')

TEST_DIRS = frozenset((
    "test", "tests", "unittest", "unit_test", "moduletest", "module_test",
    "benchmarktest", "benchmark_test", "systemtest", "system_test",
    "securitytest", "testcase", "testcases", "ittest", "testing",
    "xts", "acts", "dcts", "hats", "mts", "rts", "sts",
))
SEG_RE = re.compile(r"(^|_)(test|tests)(_|$)")
STEM_RE = re.compile(
    r"(^|_)(test|tests|unittest|moduletest|benchmarktest|testcase|testcases)(_|$)")


def is_test_or_fuzz(path):
    parts = path.replace("\\", "/").split("/")
    stem = parts[-1]
    dot = stem.rfind(".")
    if dot > 0:
        stem = stem[:dot]
    stem = stem.lower()
    for seg in parts[:-1]:
        if "fuzz" in seg.lower():
            return True
    for seg in parts[:-1]:
        if seg.lower() in TEST_DIRS:
            return True
    for seg in parts[:-1]:
        if SEG_RE.search(seg.lower()):
            return True
    return "fuzz" in stem or bool(STEM_RE.search(stem))


def _json_string(raw):
    try:
        return json.loads(b'"' + raw + b'"')
    except ValueError:
        return raw.decode("utf-8", "replace")


def _peek_first_directory(path):
    try:
        with open(path, "rb") as f:
            head = f.read(64 << 10)
    except OSError:
        return None
    match = DIR_RE.search(head)
    return _json_string(match.group(1)) if match else None


def trim(cdb_path, out_dir, filter_test=True):
    """One streaming pass: drop test/fuzz and duplicate entries.

    Returns a stats dict {"total", "kept", "test", "dup"}, or None when
    the CDB was left untouched (unreadable, minified layout, empty
    result, or sanity check failed).
    """
    try:
        with open(cdb_path, "rb") as f:
            head = f.read(512)
    except OSError:
        return None
    if head.count(b"\n") < 3:
        return None

    counters = {"total": 0, "kept": 0, "test": 0, "dup": 0}
    seen = set()
    tmp = cdb_path + ".trim-tmp"
    try:
        with open(cdb_path, "rb") as fi, open(tmp, "wb") as fo:
            fo.write(b"[\n")
            first = True
            in_entry = False
            buf = []
            for line in fi:
                stripped = line.strip()
                if not in_entry:
                    if stripped == b"{":
                        in_entry = True
                        buf = [line]
                    continue
                buf.append(line)
                if stripped in (b"}", b"},"):
                    in_entry = False
                    counters["total"] += 1
                    entry = b"".join(buf).rstrip(b" \t\r\n,")
                    keep = True
                    match = FILE_RE.search(entry)
                    if match is not None:
                        file_str = _json_string(match.group(1))
                        if filter_test and is_test_or_fuzz(file_str):
                            out_match = OUT_RE.search(entry)
                            output = _json_string(out_match.group(1)) \
                                if out_match else None
                            if output is None or not os.path.exists(
                                    os.path.join(out_dir, output)):
                                counters["test"] += 1
                                keep = False
                        if keep and file_str in seen:
                            counters["dup"] += 1
                            keep = False
                        elif keep:
                            seen.add(file_str)
                    if keep:
                        counters["kept"] += 1
                        if not first:
                            fo.write(b",\n")
                        fo.write(entry)
                        first = False
            fo.write(b"\n]\n")
    except OSError:
        if os.path.exists(tmp):
            os.remove(tmp)
        return None

    if counters["kept"] == 0 or \
            _peek_first_directory(tmp) != _peek_first_directory(cdb_path):
        if os.path.exists(tmp):
            os.remove(tmp)
        return None
    os.replace(tmp, cdb_path)
    return counters


def trim_if_stale(cdb_path, out_dir, filter_test=True):
    """Trim unless the marker says this exact CDB was already trimmed.

    The marker records the stats and its mtime; a rebuild regenerates
    compile_commands.json with a newer mtime and the trim runs again.
    """
    marker = os.path.join(out_dir, ".cdb-trimmed")
    try:
        if os.path.exists(marker) and \
                os.path.getmtime(marker) >= os.path.getmtime(cdb_path):
            return None
    except OSError:
        pass
    stats = trim(cdb_path, out_dir, filter_test=filter_test)
    if stats is not None:
        try:
            with open(marker, "w") as f:
                json.dump(stats, f)
        except OSError:
            pass
    return stats
