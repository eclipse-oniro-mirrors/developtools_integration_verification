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
expected_out_1: "Semantic error ESE0307: Overloaded method is used as value"
---*/

[Math.log10, Math.log2].forEach( function(fun) {
  arktest.assertTrue(isNaN(fun(NaN)));
  arktest.assertTrue(isNaN(fun(fun)));
  arktest.assertTrue(isNaN(fun({ toString: function() { return NaN; } })));
  arktest.assertTrue(isNaN(fun({ valueOf: function() { return -1; } })));
  arktest.assertTrue(isNaN(fun({ valueOf: function() { return 'abc'; } })));
  arktest.assertTrue(isNaN(fun(-0.1)));
  arktest.assertTrue(isNaN(fun(-1)));
  arktest.assertEQ('-Infinity', String(fun(0)));
  arktest.assertEQ('-Infinity', String(fun(-0)));
  arktest.assertEQ(0, fun(1));
  arktest.assertEQ('Infinity', String(fun(Infinity)));
});

for (let i = -310; i <= 308; i += 0.5) {
  arktest.assertEQ(i, Math.log10(Math.pow(10, i)));
  // Square roots are tested below.
  if (i != -0.5 && i != 0.5 ) {
    arktest.assertDoubleEQ(i, Math.log2(Math.pow(2, i)), Number.EPSILON);
  }
}

// Test denormals.
arktest.assertEQ(-307.77759430519706, Math.log10(1.5 * Math.pow(2, -1023)));

// Issue 4025.  Remove delta once issue 4029 has been fixed.
arktest.assertDoubleEQ(-9.643274665532873e-17, Math.log10(1-Number.EPSILON), 3e-32);

// Test Math.log2(2^k) for -1074 <= k <= 1023.
let n = -1074;
// This loop covers n from -1074 to -1043
for (let lowbits = 1; lowbits <= 0x80000000; lowbits *= 2) {
  let x = ArkTools.constructDouble(0, lowbits);
  arktest.assertEQ(n, Math.log2(x));
  n++;
}
// This loop covers n from -1042 to -1023
for (let hibits = 1; hibits <= 0x80000; hibits *= 2) {
  let x = ArkTools.constructDouble(hibits, 0);
  arktest.assertEQ(n, Math.log2(x));
  n++;
}
// The rest of the normal values of 2^n
let x = 1;
for (let n = -1022; n <= 1023; ++n) {
  let x = Math.pow(2, n);
  arktest.assertEQ(n, Math.log2(x));
}

// Test special values.
// Expectation isn't exactly 1/2 because Math.SQRT2 isn't exactly sqrt(2).
arktest.assertEQ(0.5000000000000001, Math.log2(Math.SQRT2));

// Expectation isn't exactly -1/2 because Math.SQRT1_2 isn't exactly sqrt(1/2).
arktest.assertEQ(-0.4999999999999999, Math.log2(Math.SQRT1_2));

arktest.assertEQ(3.321928094887362, Math.log2(10));
arktest.assertEQ(6.643856189774724, Math.log2(100));

// Test relationships
x = 1;
for (let k = 0; k < 1000; ++k) {
  let y = Math.abs(Math.log2(x) + Math.log2(1/x));
  arktest.assertDoubleEQ(0, y, 1.5e-14);
  x *= 1.1;
}

x = Math.pow(2, -100);
for (let k = 0; k < 1000; ++k) {
  let y = Math.log2(x);
  const expected = Math.log(x) / Math.LN2;
  const err = Math.abs(y - expected) / expected;
  arktest.assertDoubleEQ(0, err, 1e-15);
  x *= 1.1;
}
