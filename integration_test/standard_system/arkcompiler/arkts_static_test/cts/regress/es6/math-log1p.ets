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

/*---
tags: [compile-only, negative]
expected_out_1: "Syntax error ESY0320: Function expressions are not supported, use arrow functions instead"
---*/

arktest.assertTrue(isNaN(Math.log1p(NaN)));
arktest.assertTrue(isNaN(Math.log1p(function() {})));
arktest.assertTrue(isNaN(Math.log1p({ toString: function() { return NaN; } })));
arktest.assertTrue(isNaN(Math.log1p({ valueOf: function() { return 'abc'; } })));
arktest.assertEQ(Infinity, 1/Math.log1p(0));
arktest.assertEQ(-Infinity, 1/Math.log1p(-0));
arktest.assertEQ(Infinity, Math.log1p(Infinity));
arktest.assertEQ(-Infinity, Math.log1p(-1));
arktest.assertTrue(isNaN(Math.log1p(-2)));
arktest.assertTrue(isNaN(Math.log1p(-Infinity)));

for (let x = 1E300; x > 1E16; x *= 0.8) {
  let expected = Math.log(x + 1);
  arktest.assertDoubleEQ(expected, Math.log1p(x), expected * 1E-16);
}

// Values close to 0:
// Use Taylor expansion at 1 for log(x) as test expectation:
// log1p(x) == log(x + 1) == 0 + x / 1 - x^2 / 2 + x^3 / 3 - ...
function log1p(x) {
  let terms = [];
  let prod = x;
  for (let i = 1; i <= 20; i++) {
    terms.push(prod / i);
    prod *= -x;
  }
  let sum = 0;
  while (terms.length > 0) { sum += terms.pop(); }
  return sum;
}

for (let x = 1E-1; x > 1E-300; x *= 0.8) {
  let expected = log1p(x);
  arktest.assertDoubleEQ(expected, Math.log1p(x), expected * 1E-16);
}

// Issue 3481.
arktest.assertEQ(6.9756137364252422e-03,
             Math.log1p(8070450532247929/Math.pow(2,60)));

// Tests related to the fdlibm implementation.
// Test largest double value.
arktest.assertEQ(709.782712893384, Math.log1p(1.7976931348623157e308));
// Test small values.
arktest.assertEQ(Math.pow(2, -55), Math.log1p(Math.pow(2, -55)));
arktest.assertEQ(9.313225741817976e-10, Math.log1p(Math.pow(2, -30)));
// Cover various code paths.
// -.2929 < x < .41422, k = 0
arktest.assertEQ(-0.2876820724517809, Math.log1p(-0.25));
arktest.assertEQ(0.22314355131420976, Math.log1p(0.25));
// 0.41422 < x < 9.007e15
arktest.assertEQ(2.3978952727983707, Math.log1p(10));
// x > 9.007e15
arktest.assertEQ(36.841361487904734, Math.log1p(10e15));
// Normalize u.
arktest.assertEQ(37.08337388996168, Math.log1p(12738099905822720));
// Normalize u/2.
arktest.assertEQ(37.08336444902049, Math.log1p(12737979646738432));
// |f| = 0, k != 0
arktest.assertEQ(1.3862943611198906, Math.log1p(3));
// |f| != 0, k != 0
arktest.assertEQ(1.3862945995384413, Math.log1p(3 + Math.pow(2,-20)));
// final if-clause: k = 0
arktest.assertEQ(0.5596157879354227, Math.log1p(0.75));
// final if-clause: k != 0
arktest.assertEQ(0.8109302162163288, Math.log1p(1.25));
