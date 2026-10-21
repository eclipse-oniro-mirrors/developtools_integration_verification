"""Bounded standard-library ELF reader for dynamic-table and export facts.

The reader deliberately reads only the ELF header, program headers, dynamic
table, dynamic strings, section names, and dynamic symbols. Installing LIEF
would turn an architecture inventory into an optional-dependency problem
without adding information this collector needs.
"""
import struct


PT_LOAD = 1
PT_DYNAMIC = 2
DT_NULL = 0
DT_NEEDED = 1
DT_STRTAB = 5
DT_STRSZ = 10
DT_SONAME = 14

SHT_DYNSYM = 11
SHN_UNDEF = 0
STB_GLOBAL = 1
STB_WEAK = 2


class ElfFormatError(Exception):
    pass


class BoundedReader:
    """File wrapper that charges every byte actually read to the scan budget."""

    def __init__(self, handle, file_limit, total_limit, used):
        self._handle = handle
        self._file_remaining = file_limit
        self._total_remaining = total_limit - used
        self._used = used

    @property
    def used(self):
        return self._used

    def read(self, size=-1):
        if size is None or size < 0:
            raise ElfFormatError("UNBOUNDED_ELF_READ")
        if size == 0:
            return b''
        count = min(size, self._file_remaining, self._total_remaining)
        if count <= 0:
            if size > self._total_remaining:
                raise ElfFormatError("ELF_TOTAL_LIMIT")
            raise ElfFormatError("ELF_SIZE_LIMIT")
        data = self._handle.read(count)
        self._file_remaining -= len(data)
        self._total_remaining -= len(data)
        self._used += len(data)
        return data

    def seek(self, offset):
        return self._handle.seek(offset)


def _cstring(handle, offset, limit=4096):
    if offset < 0:
        raise ElfFormatError("INVALID_STRING_OFFSET")
    handle.seek(offset)
    data = handle.read(limit)
    end = data.find(b"\0")
    if end < 0:
        if len(data) == limit:
            raise ElfFormatError("STRING_SIZE_LIMIT")
        end = len(data)
    try:
        return data[:end].decode("utf-8")
    except UnicodeError as exc:
        raise ElfFormatError("INVALID_STRING_ENCODING") from exc


def read_elf(handle):
    """Read ELF facts, or return None for a non-ELF file."""
    header = handle.read(64)
    if len(header) < 16 or header[:4] != b"\x7fELF":
        return None
    ei_class, ei_data = header[4], header[5]
    if ei_class not in (1, 2) or ei_data not in (1, 2):
        raise ElfFormatError("UNSUPPORTED_ELF_IDENTITY")
    endian = "<" if ei_data == 1 else ">"
    if ei_class == 2:
        e_type, e_machine = struct.unpack_from(endian + "HH", header, 16)
        phoff, = struct.unpack_from(endian + "Q", header, 32)
        shoff, = struct.unpack_from(endian + "Q", header, 40)
        phentsize, phnum, shentsize, shnum, shstrndx = struct.unpack_from(
            endian + "HHHHH", header, 54)
        if phnum and phentsize < 56:
            raise ElfFormatError("INVALID_PROGRAM_HEADER_SIZE")
        if shnum and shentsize < 64:
            raise ElfFormatError("INVALID_SECTION_HEADER_SIZE")
    else:
        e_type, e_machine = struct.unpack_from(endian + "HH", header, 16)
        phoff, = struct.unpack_from(endian + "I", header, 28)
        shoff, = struct.unpack_from(endian + "I", header, 32)
        phentsize, phnum, shentsize, shnum, shstrndx = struct.unpack_from(
            endian + "HHHHH", header, 42)
        if phnum and phentsize < 32:
            raise ElfFormatError("INVALID_PROGRAM_HEADER_SIZE")
        if shnum and shentsize < 40:
            raise ElfFormatError("INVALID_SECTION_HEADER_SIZE")
    if phnum > 256:
        raise ElfFormatError("PROGRAM_HEADER_COUNT_LIMIT")
    if shnum > 65535:
        raise ElfFormatError("SECTION_HEADER_COUNT_LIMIT")

    handle.seek(phoff)
    headers = handle.read(phentsize * phnum)
    if len(headers) != phentsize * phnum:
        raise ElfFormatError("TRUNCATED_PROGRAM_HEADERS")
    loads = []
    dynamic = None
    for index in range(phnum):
        item = headers[index * phentsize:(index + 1) * phentsize]
        if ei_class == 2:
            p_type, = struct.unpack_from(endian + "I", item, 0)
            p_offset, = struct.unpack_from(endian + "Q", item, 8)
            p_vaddr, = struct.unpack_from(endian + "Q", item, 16)
            p_filesz, = struct.unpack_from(endian + "Q", item, 32)
        else:
            p_type, = struct.unpack_from(endian + "I", item, 0)
            p_offset, = struct.unpack_from(endian + "I", item, 4)
            p_vaddr, = struct.unpack_from(endian + "I", item, 12)
            p_filesz, = struct.unpack_from(endian + "I", item, 20)
        if p_type == PT_LOAD:
            loads.append((p_vaddr, p_offset, p_filesz))
        elif p_type == PT_DYNAMIC and dynamic is None:
            dynamic = (p_offset, p_filesz)

    common = {
        "engine": "internal-elf-dynamic-v1",
        "format": f"ELF{32 if ei_class == 1 else 64}{'LE' if ei_data == 1 else 'BE'}",
        "type": {1: "rel", 2: "exec", 3: "dyn", 4: "core"}.get(e_type, "unknown"),
        "machine": e_machine,
    }
    sections = _read_sections(handle, shoff, shentsize, shnum, shstrndx,
                              ei_class, endian)
    section_facts = _section_facts(handle, sections, ei_class, endian)
    common.update(section_facts)
    if dynamic is None:
        return dict(common, soname=None, needed=(), dynamic=False)

    p_offset, p_filesz = dynamic
    if p_filesz > 1024 * 1024:
        raise ElfFormatError("DYNAMIC_SIZE_LIMIT")
    handle.seek(p_offset)
    entries = handle.read(p_filesz)
    if len(entries) != p_filesz:
        raise ElfFormatError("TRUNCATED_DYNAMIC_TABLE")
    entry_size = 16 if ei_class == 2 else 8
    if len(entries) % entry_size:
        raise ElfFormatError("INVALID_DYNAMIC_TABLE_SIZE")

    def vaddr_to_offset(value):
        for vaddr, offset, filesz in loads:
            if vaddr <= value < vaddr + filesz:
                return offset + value - vaddr
        return None

    strtab = None
    raw = []
    for index in range(0, len(entries) - entry_size + 1, entry_size):
        if ei_class == 2:
            tag, value = struct.unpack_from(endian + "QQ", entries, index)
        else:
            tag, value = struct.unpack_from(endian + "II", entries, index)
        if tag == DT_NULL:
            break
        if tag == DT_STRTAB:
            strtab = vaddr_to_offset(value)
        elif tag in (DT_NEEDED, DT_SONAME):
            raw.append((tag, value))
    if strtab is None:
        raise ElfFormatError("DYNAMIC_STRTAB_MISSING")

    needed = []
    soname = None
    for tag, value in raw:
        text = _cstring(handle, strtab + value)
        if tag == DT_NEEDED:
            needed.append(text)
        else:
            soname = text
    return dict(common, soname=soname, needed=tuple(needed), dynamic=True)


def _read_sections(handle, shoff, shentsize, shnum, shstrndx,
                   ei_class, endian):
    if not shnum:
        return ()
    if shstrndx == 0xffff or shstrndx >= shnum:
        raise ElfFormatError("INVALID_SECTION_NAME_INDEX")
    handle.seek(shoff)
    raw = handle.read(shentsize * shnum)
    if len(raw) != shentsize * shnum:
        raise ElfFormatError("TRUNCATED_SECTION_HEADERS")
    sections = []
    for index in range(shnum):
        item = raw[index * shentsize:(index + 1) * shentsize]
        if ei_class == 2:
            values = struct.unpack_from(endian + "IIQQQQIIQQ", item, 0)
        else:
            values = struct.unpack_from(endian + "IIIIIIIIII", item, 0)
        sections.append({
            "name_offset": values[0],
            "type": values[1],
            "offset": values[4],
            "size": values[5],
            "link": values[6],
            "entsize": values[9],
        })
    names = sections[shstrndx]
    handle.seek(names["offset"])
    name_data = handle.read(names["size"])
    if len(name_data) != names["size"]:
        raise ElfFormatError("TRUNCATED_SECTION_NAMES")
    for section in sections:
        offset = section.pop("name_offset")
        if offset < 0 or offset >= len(name_data):
            raise ElfFormatError("INVALID_SECTION_NAME_OFFSET")
        end = name_data.find(b"\0", offset)
        if end < 0:
            end = len(name_data)
        try:
            section["name"] = name_data[offset:end].decode("utf-8")
        except UnicodeError as exc:
            raise ElfFormatError("INVALID_SECTION_NAME_ENCODING") from exc
    return tuple(sections)


def _section_facts(handle, sections, ei_class, endian):
    facts = {
        "cangjie": any(section["name"] == ".cjmetadata" for section in sections),
        "ani_constructor": False,
    }
    for section in sections:
        if section["type"] != SHT_DYNSYM:
            continue
        if section["link"] >= len(sections):
            raise ElfFormatError("INVALID_DYNSYM_STRING_TABLE")
        strings = sections[section["link"]]
        handle.seek(strings["offset"])
        string_data = handle.read(strings["size"])
        if len(string_data) != strings["size"]:
            raise ElfFormatError("TRUNCATED_DYNSYM_STRINGS")
        expected_size = 24 if ei_class == 2 else 16
        if not section["entsize"] or section["entsize"] % expected_size:
            raise ElfFormatError("INVALID_DYNSYM_ENTRY_SIZE")
        handle.seek(section["offset"])
        symbols = handle.read(section["size"])
        if len(symbols) != section["size"]:
            raise ElfFormatError("TRUNCATED_DYNSYM")
        for offset in range(0, len(symbols), section["entsize"]):
            if ei_class == 2:
                name, info, _, shndx, _, _ = struct.unpack_from(
                    endian + "IBBHQQ", symbols, offset)
            else:
                name, _, _, info, _, shndx = struct.unpack_from(
                    endian + "IIIBBH", symbols, offset)
            binding = info >> 4
            if (shndx == SHN_UNDEF or binding not in (STB_GLOBAL, STB_WEAK)
                    or name >= len(string_data)):
                continue
            end = string_data.find(b"\0", name)
            if end < 0:
                end = len(string_data)
            if string_data[name:end] == b"ANI_Constructor":
                facts["ani_constructor"] = True
                break
        if facts["ani_constructor"]:
            break
    return facts
