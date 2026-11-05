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
// https://github.com/mathiasbynens/String.fromCodePoint


/*---
tags: [compile-only, negative]
expected_out_1: "Semantic error ESE0087: Property 'length' does not exist on type 'Function'"
---*/

const condition: boolean = String.fromCodePoint.length === 1;
arktest.assertTrue(condition);
arktest.assertEQ(String.propertyIsEnumerable('fromCodePoint'), false);

arktest.assertEQ(String.fromCodePoint(''), '\0');
arktest.assertEQ(String.fromCodePoint(), '');
arktest.assertEQ(String.fromCodePoint(-0), '\0');
arktest.assertEQ(String.fromCodePoint(0), '\0');
arktest.assertEQ(String.fromCodePoint(0x1D306), '\uD834\uDF06');
arktest.assertEQ(
  String.fromCodePoint(0x1D306, 0x61, 0x1D307),
  '\uD834\uDF06a\uD834\uDF07');
arktest.assertEQ(String.fromCodePoint(0x61, 0x62, 0x1D307), 'ab\uD834\uDF07');
arktest.assertEQ(String.fromCodePoint(false), '\0');
arktest.assertEQ(String.fromCodePoint(null), '\0');

arktest.expectThrow(function () { String.fromCodePoint('_'); }, ((e: Error): boolean => e instanceof RangeError));
arktest.expectThrow(
  function () { String.fromCodePoint('+Infinity'); },
  ((e: Error): boolean => e instanceof RangeError)
);
arktest.expectThrow(
  function () { String.fromCodePoint('-Infinity'); },
  ((e: Error): boolean => e instanceof RangeError)
);
arktest.expectThrow(function () { String.fromCodePoint(-1); }, ((e: Error): boolean => e instanceof RangeError));
arktest.expectThrow(
  function () { String.fromCodePoint(0x10FFFF + 1); },
  ((e: Error): boolean => e instanceof RangeError)
);
arktest.expectThrow(function () { String.fromCodePoint(3.14); }, ((e: Error): boolean => e instanceof RangeError));
arktest.expectThrow(function () { String.fromCodePoint(3e-2); }, ((e: Error): boolean => e instanceof RangeError));
arktest.expectThrow(function () { String.fromCodePoint(-Infinity); }, ((e: Error): boolean => e instanceof RangeError));
arktest.expectThrow(function () { String.fromCodePoint(+Infinity); }, ((e: Error): boolean => e instanceof RangeError));
arktest.expectThrow(function () { String.fromCodePoint(NaN); }, ((e: Error): boolean => e instanceof RangeError));
arktest.expectThrow(function () { String.fromCodePoint(undefined); }, ((e: Error): boolean => e instanceof RangeError));
arktest.expectThrow(function () { String.fromCodePoint({}); }, ((e: Error): boolean => e instanceof RangeError));
arktest.expectThrow(function () { String.fromCodePoint(/./); }, ((e: Error): boolean => e instanceof RangeError));
arktest.expectThrow(function () {
  String.fromCodePoint({
    valueOf: function () { throw Error(); }
  });
}, ((e: Error): boolean => e instanceof Error));
arktest.expectThrow(function () {
  String.fromCodePoint({
    valueOf: function () { throw Error(); }
  });
}, ((e: Error): boolean => e instanceof Error));
let tmp = 0x60;
arktest.assertEQ(String.fromCodePoint({
  valueOf: function () { ++tmp; return tmp; }
}), 'a');
arktest.assertEQ(tmp, 0x61);

let counter = Math.pow(2, 15) * 3 / 2;
let result = [];
while (--counter >= 0) {
  result.push(0); // one code unit per symbol
}
String.fromCodePoint.apply(null, result); // must not throw

let counter = Math.pow(2, 15) * 3 / 2;
let result = [];
while (--counter >= 0) {
  result.push(0xFFFF + 1); // two code units per symbol
}
String.fromCodePoint.apply(null, result); // must not throw
