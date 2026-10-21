#!/usr/bin/env python3
# coding=utf-8

#
# Copyright (c) 2021-2026 Huawei Device Co., Ltd.
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
"""Bounded reader for little-endian HCB 0.7; no HCS text or external tool."""
import struct
from dataclasses import dataclass


@dataclass
class Node:
    name: str
    attributes: dict
    children: list
    offset: int


class HCBError(ValueError):
    pass


class Reader:
    def __init__(self, data, *, depth=128, items=100000, cancelled_check=lambda: None):
        self.data, self.pos = data, 20
        self.max_depth, self.remaining, self.check = depth, items, cancelled_check
        self.offsets, self.references = set(), []
        if len(data) < 20:
            raise HCBError('HCB_HEADER_TRUNCATED')
        magic, major, minor, checksum, size = struct.unpack_from('<IIIIi', data)
        if magic != 0xA00AA00A or (major, minor) != (0, 7) or checksum != 0:
            raise HCBError('HCB_HEADER_UNSUPPORTED')
        if len(data) != 20 + abs(size):
            raise HCBError('HCB_LENGTH')
        self.aligned = size < 0
        self.prefix = 4 if self.aligned else 1

    def tick(self):
        self.check()
        self.remaining -= 1
        if self.remaining < 0:
            raise HCBError('HCB_ITEM_LIMIT')

    def number(self, width, end, *, padded=False):
        size = max(width, 4) if padded and self.aligned else width
        if self.pos + size > end:
            raise HCBError('HCB_TRUNCATED')
        result = int.from_bytes(self.data[self.pos:self.pos + size], 'little')
        self.pos += size
        if result >= 1 << (8 * width):
            raise HCBError('HCB_NUMBER_RANGE')
        return result

    def string(self, end):
        start = self.pos
        stop = self.data.find(b'\0', start, end)
        if stop < 0:
            raise HCBError('HCB_UNTERMINATED_STRING')
        size = stop - start + 1
        self.pos += (size + 3) // 4 * 4 if self.aligned else size
        if self.pos > end:
            raise HCBError('HCB_STRING_BOUNDARY')
        try:
            return self.data[start:stop].decode('utf-8')
        except UnicodeError as exc:
            raise HCBError('HCB_STRING_ENCODING') from exc

    def value(self, end, *, array_allowed=True):
        self.tick()
        opcode = self.number(self.prefix, end)
        if opcode == 0x14:
            return self.string(end)
        if opcode == 0x04 and array_allowed:
            count = self.number(2, end, padded=True)
            if count > self.remaining:
                raise HCBError('HCB_ITEM_LIMIT')
            return [self.value(end, array_allowed=False) for _ in range(count)]
        if opcode == 0x03:
            offset = self.number(4, end)
            self.references.append(offset)
            return {'$ref': offset}
        if opcode in (0x10, 0x11, 0x12, 0x13):
            return self.number(1 << (opcode - 0x10), end, padded=True)
        raise HCBError('HCB_VALUE_OPCODE')

    def node(self, end, depth=1):
        self.tick()
        if depth > self.max_depth:
            raise HCBError('HCB_DEPTH_LIMIT')
        offset = self.pos
        if self.number(self.prefix, end) != 1:
            raise HCBError('HCB_NODE_OPCODE')
        name = self.string(end)
        if not name:
            raise HCBError('HCB_EMPTY_NAME')
        size = self.number(4, end)
        boundary = self.pos + size
        if boundary > end:
            raise HCBError('HCB_NODE_BOUNDARY')
        self.offsets.add(offset)
        attrs, children, names = {}, [], set()
        while self.pos < boundary:
            start = self.pos
            opcode = self.number(self.prefix, boundary)
            if opcode == 1:
                self.pos = start
                child = self.node(boundary, depth + 1)
                if child.name in names:
                    raise HCBError('HCB_DUPLICATE_NODE')
                names.add(child.name)
                children.append(child)
            elif opcode == 2:
                self.tick()
                key = self.string(boundary)
                if not key or key in attrs:
                    raise HCBError('HCB_ATTRIBUTE_NAME')
                attrs[key] = self.value(boundary)
            else:
                raise HCBError('HCB_ITEM_OPCODE')
        return Node(name, attrs, children, offset)

    def read(self):
        root = self.node(len(self.data))
        if root.name != 'root' or self.pos != len(self.data):
            raise HCBError('HCB_ROOT')
        if any(ref not in self.offsets for ref in self.references):
            raise HCBError('HCB_REFERENCE')
        return root


def read_hcb(data, **options):
    return Reader(data, **options).read()
