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
expected_out_1: "Syntax error ESY0194: Parameter declaration should have an explicit type annotation."
---*/

function arrayMaker(x) {
  return x;
}
arrayMaker.prototype = Array.prototype;

const arrayConstructors = [
  Uint8Array,
  Int8Array,
  Uint16Array,
  Int16Array,
  Uint32Array,
  Int32Array,
  Uint8ClampedArray,
  Float32Array,
  Float64Array,
  arrayMaker  // Also test arrays
];

function assertArrayLikeEquals(value, expected, type) {
  arktest.assertEQ(value.__proto__, type.prototype);
  arktest.assertEQ(expected.length, value.length);
  for (let i = 0; i < value.length; ++i) {
    arktest.assertEQ(expected[i], value[i]);
  }
}

for (let constructor of arrayConstructors) {
  // Test reversing both even and odd length arrays
  let a = new constructor([1, 2, 3]);
  assertArrayLikeEquals(a.reverse(), [3, 2, 1], constructor);
  assertArrayLikeEquals(a, [3, 2, 1], constructor);

  a = new constructor([1, 2, 3, 4]);
  assertArrayLikeEquals(a.reverse(), [4, 3, 2, 1], constructor);
  assertArrayLikeEquals(a, [4, 3, 2, 1], constructor);

  if (constructor != arrayMaker) {
    // Cannot be called on objects which are not TypedArrays
    arktest.expectThrow(
      function () { a.reverse.call({ length: 0 }); },
      ((e: Error): boolean => e instanceof TypeError)
    );
  } else {
    // Array.reverse works on array-like objects
    let x = { length: 2, 1: 5 };
    a.reverse.call(x);
    arktest.assertEQ(2, x.length);
    arktest.assertFalse(Object.hasOwnProperty(x, '1'));
    arktest.assertEQ(5, x[0]);
  }

  arktest.assertEQ(0, a.reverse.length);

  // Detached Operation
  if (constructor != arrayMaker) {
    const array = new constructor([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
    ArkTools.arrayBufferDetach(array.buffer);
    arktest.expectThrow(() => array.reverse(), ((e: Error): boolean => e instanceof TypeError));
  }
}
