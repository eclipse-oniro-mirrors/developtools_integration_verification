/*
 * Copyright (c) 2025 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

// Tests taken from:
// https://github.com/mathiasbynens/String.prototype.codePointAt

/*---
tags: [compile-only, negative]
expected_out_1: "Semantic error ESE0087: Property 'prototype' does not exist on type 'String'"
---*/

const codePointAtLength: Any = String.prototype.codePointAt.length;
arktest.assertEQ(codePointAtLength, 1);
arktest.assertEQ(String.prototype.propertyIsEnumerable('codePointAt'), false);

// String that starts with a BMP symbol
arktest.assertEQ('abc\uD834\uDF06def'.codePointAt(''), 0x61);
arktest.assertEQ('abc\uD834\uDF06def'.codePointAt('_'), 0x61);
arktest.assertEQ('abc\uD834\uDF06def'.codePointAt(), 0x61);
arktest.assertEQ('abc\uD834\uDF06def'.codePointAt(-Infinity), undefined);
arktest.assertEQ('abc\uD834\uDF06def'.codePointAt(-1), undefined);
arktest.assertEQ('abc\uD834\uDF06def'.codePointAt(-0), 0x61);
arktest.assertEQ('abc\uD834\uDF06def'.codePointAt(0), 0x61);
arktest.assertEQ('abc\uD834\uDF06def'.codePointAt(3), 0x1D306);
arktest.assertEQ('abc\uD834\uDF06def'.codePointAt(4), 0xDF06);
arktest.assertEQ('abc\uD834\uDF06def'.codePointAt(5), 0x64);
arktest.assertEQ('abc\uD834\uDF06def'.codePointAt(42), undefined);
arktest.assertEQ('abc\uD834\uDF06def'.codePointAt(Infinity), undefined);
arktest.assertEQ('abc\uD834\uDF06def'.codePointAt(Infinity), undefined);
arktest.assertEQ('abc\uD834\uDF06def'.codePointAt(NaN), 0x61);
arktest.assertEQ('abc\uD834\uDF06def'.codePointAt(false), 0x61);
arktest.assertEQ('abc\uD834\uDF06def'.codePointAt(null), 0x61);
arktest.assertEQ('abc\uD834\uDF06def'.codePointAt(undefined), 0x61);

// String that starts with an astral symbol
arktest.assertEQ('\uD834\uDF06def'.codePointAt(''), 0x1D306);
arktest.assertEQ('\uD834\uDF06def'.codePointAt('1'), 0xDF06);
arktest.assertEQ('\uD834\uDF06def'.codePointAt('_'), 0x1D306);
arktest.assertEQ('\uD834\uDF06def'.codePointAt(), 0x1D306);
arktest.assertEQ('\uD834\uDF06def'.codePointAt(-1), undefined);
arktest.assertEQ('\uD834\uDF06def'.codePointAt(-0), 0x1D306);
arktest.assertEQ('\uD834\uDF06def'.codePointAt(0), 0x1D306);
arktest.assertEQ('\uD834\uDF06def'.codePointAt(1), 0xDF06);
arktest.assertEQ('\uD834\uDF06def'.codePointAt(42), undefined);
arktest.assertEQ('\uD834\uDF06def'.codePointAt(false), 0x1D306);
arktest.assertEQ('\uD834\uDF06def'.codePointAt(null), 0x1D306);
arktest.assertEQ('\uD834\uDF06def'.codePointAt(undefined), 0x1D306);

// Lone high surrogates
arktest.assertEQ('\uD834abc'.codePointAt(''), 0xD834);
arktest.assertEQ('\uD834abc'.codePointAt('_'), 0xD834);
arktest.assertEQ('\uD834abc'.codePointAt(), 0xD834);
arktest.assertEQ('\uD834abc'.codePointAt(-1), undefined);
arktest.assertEQ('\uD834abc'.codePointAt(-0), 0xD834);
arktest.assertEQ('\uD834abc'.codePointAt(0), 0xD834);
arktest.assertEQ('\uD834abc'.codePointAt(false), 0xD834);
arktest.assertEQ('\uD834abc'.codePointAt(NaN), 0xD834);
arktest.assertEQ('\uD834abc'.codePointAt(null), 0xD834);
arktest.assertEQ('\uD834abc'.codePointAt(undefined), 0xD834);

// Lone low surrogates
arktest.assertEQ('\uDF06abc'.codePointAt(''), 0xDF06);
arktest.assertEQ('\uDF06abc'.codePointAt('_'), 0xDF06);
arktest.assertEQ('\uDF06abc'.codePointAt(), 0xDF06);
arktest.assertEQ('\uDF06abc'.codePointAt(-1), undefined);
arktest.assertEQ('\uDF06abc'.codePointAt(-0), 0xDF06);
arktest.assertEQ('\uDF06abc'.codePointAt(0), 0xDF06);
arktest.assertEQ('\uDF06abc'.codePointAt(false), 0xDF06);
arktest.assertEQ('\uDF06abc'.codePointAt(NaN), 0xDF06);
arktest.assertEQ('\uDF06abc'.codePointAt(null), 0xDF06);
arktest.assertEQ('\uDF06abc'.codePointAt(undefined), 0xDF06);

arktest.expectThrow(function() {
  String.prototype.codePointAt.call(undefined);
}, ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow(function() {
  String.prototype.codePointAt.call(undefined, 4);
}, ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow(function() {
  String.prototype.codePointAt.call(null);
}, ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow(function() {
  String.prototype.codePointAt.call(null, 4);
}, ((e: Error): boolean => e instanceof TypeError));
arktest.assertEQ(String.prototype.codePointAt.call(42, 0), 0x34);
arktest.assertEQ(String.prototype.codePointAt.call(42, 1), 0x32);
arktest.assertEQ(String.prototype.codePointAt.call({
  toString: function() { return 'abc'; }
}, 2), 0x63);
let tmp = 0;
arktest.assertEQ(String.prototype.codePointAt.call({
  toString: function() { ++tmp; return String(tmp); }
}, 0), 0x31);
arktest.assertEQ(tmp, 1);
