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
expected_out_1: "Semantic error ESE0127: No matching call signature for isNaN(...)"
---*/

const hypotObjectIsNaN: boolean = Number.isNaN(Math.hypot({}));
arktest.assertTrue(hypotObjectIsNaN);
const hypotUndefinedFirstIsNaN: boolean = Number.isNaN(Math.hypot(undefined, 1));
arktest.assertTrue(hypotUndefinedFirstIsNaN);
const hypotUndefinedSecondIsNaN: boolean = Number.isNaN(Math.hypot(1, undefined));
arktest.assertTrue(hypotUndefinedSecondIsNaN);
const hypotFunctionIsNaN: boolean = Number.isNaN(Math.hypot(Math.hypot, 1));
arktest.assertTrue(hypotFunctionIsNaN);
arktest.assertEQ(1, Math.hypot(1));
arktest.assertEQ(Math.PI, Math.hypot(Math.PI));
arktest.assertEQ(5, Math.hypot(3, 4));
arktest.assertEQ(13, Math.hypot(3, 4, 12));
arktest.assertEQ(15, Math.hypot(' 2 ',
                            '0x5',
                            { valueOf: function() { return '0xe'; } }));
arktest.assertEQ(17, Math.hypot({ valueOf: function() { return 1; } },
                            { toString: function() { return 12; } },
                            { toString: function() { return '12'; } }));

// Check function length.
arktest.assertEQ(2, Math.hypot.length);

// Check that 0 is returned for no arguments.
arktest.assertEQ(0, Math.hypot());

// Check that Infinity is returned if any of the arguments is +/-Infinity.
arktest.assertEQ('Infinity', String(Math.hypot(NaN, Infinity)));
arktest.assertEQ('Infinity', String(Math.hypot(1, -Infinity, 2)));

// Check that NaN is returned if any argument is NaN and none is +/-Infinity/
const hypotNaNLastIsNaN: boolean = Number.isNaN(Math.hypot(1, 2, NaN));
arktest.assertTrue(hypotNaNLastIsNaN);
const hypotNaNFirstIsNaN: boolean = Number.isNaN(Math.hypot(NaN, NaN, 4));
arktest.assertTrue(hypotNaNFirstIsNaN);

// Check that +0 is returned if all arguments are +/-0.
arktest.assertEQ('Infinity', String(1/Math.hypot(-0)));
arktest.assertEQ('Infinity', String(1/Math.hypot(0)));
arktest.assertEQ('Infinity', String(1/Math.hypot(-0, -0)));
arktest.assertEQ('Infinity', String(1/Math.hypot(-0, 0)));

// Check that we avoid overflows and underflows.
arktest.assertDoubleEQ(5E300, Math.hypot(3E300, 4E300), 1E285);
arktest.assertDoubleEQ(17E-300, Math.hypot(8E-300, 15E-300), 1E-315);
arktest.assertDoubleEQ(19E300, Math.hypot(6E300, 6E300, 17E300), 1E285);

// Check that we sufficiently account for rounding errors when summing up.
// For this, we calculate a simple fractal square that recurses in the
// fourth quarter.
let fractals = [];
let edgeLength = Math.E * 1E20;

let fractalLength = edgeLength;
while(fractalLength >= 1) {
  fractalLength *= 0.5;
  fractals.push(fractalLength);
  fractals.push(fractalLength);
  fractals.push(fractalLength);
}

fractals.push(fractalLength);
arktest.assertDoubleEQ(edgeLength, Math.hypot.apply(Math, fractals), 1E-15);
fractals.reverse();
arktest.assertDoubleEQ(edgeLength, Math.hypot.apply(Math, fractals), 1E-15);
// Also shuffle the array.
let c = 0;
function randomSort(a, b) { c++; return (c & 3) - 1.5; }
fractals.sort(randomSort);
arktest.assertDoubleEQ(edgeLength, Math.hypot.apply(Math, fractals), 1E-15);
fractals.sort(randomSort);
arktest.assertDoubleEQ(edgeLength, Math.hypot.apply(Math, fractals), 1E-15);
