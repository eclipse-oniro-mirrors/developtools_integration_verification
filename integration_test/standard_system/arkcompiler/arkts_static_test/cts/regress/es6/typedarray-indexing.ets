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
expected_out_1: "Syntax error ESY0318: Class cannot be used as object."
---*/

const typedArrayConstructors = [
  Uint8Array,
  Int8Array,
  Uint16Array,
  Int16Array,
  Uint32Array,
  Int32Array,
  Uint8ClampedArray,
  Float32Array,
  Float64Array
];

const tmp = {
  [Symbol.toPrimitive]() {
    arktest.assertTrue(false, 'Parameter should not be processed when ' +
                      'array.[[ViewedArrayBuffer]] is detached.');
    return 0;
  }
};

for (let constructor of typedArrayConstructors) {
  let array = new constructor([1, 2, 3, 1, 2, 3, 1, 2, 3, 1, 2, 3]);

  // ----------------------------------------------------------------------
  // ArkTools.typedArray%.prototype.indexOf.
  // ----------------------------------------------------------------------

  // Negative cases.
  arktest.assertEQ(-1, new constructor([]).indexOf(1));
  arktest.assertEQ(-1, array.indexOf(4));
  arktest.assertEQ(-1, array.indexOf(3, array.length));

  arktest.assertEQ(2, array.indexOf(3));
  // Negative index out of range.
  arktest.assertEQ(0, array.indexOf(1, -17));
  // Negative index in rage.
  arktest.assertEQ(3, array.indexOf(1, -11));
  // Index in range.
  arktest.assertEQ(3, array.indexOf(1, 1));
  arktest.assertEQ(3, array.indexOf(1, 3));
  arktest.assertEQ(6, array.indexOf(1, 4));

  // Basic TypedArray function properties
  arktest.assertEQ(1, array.indexOf.length);
  arktest.expectThrow(function(){ array.indexOf.call([1], 1); }, ((e: Error): boolean => e instanceof TypeError));
  Object.defineProperty(array, 'length', {value: 1});
  arktest.assertEQ(array.indexOf(2), 1);

  // Index of infinite value
  array = new constructor([NaN, 2, 3, +Infinity, -Infinity, 5, 6]);
  if (constructor == Float32Array || constructor == Float64Array) {
    arktest.assertEQ(3, array.indexOf(Infinity));
    arktest.assertEQ(4, array.indexOf(-Infinity));
  } else {
    arktest.assertEQ(-1, array.indexOf(Infinity));
    arktest.assertEQ(-1, array.indexOf(-Infinity));
  }
  arktest.assertEQ(-1, array.indexOf(NaN));

  // Detached Operation
  let array = new constructor([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
  ArkTools.arrayBufferDetach(array.buffer);
  arktest.expectThrow(() => array.indexOf(tmp), ((e: Error): boolean => e instanceof TypeError));

  // ----------------------------------------------------------------------
  // ArkTools.typedArray%.prototype.lastIndexOf.
  // ----------------------------------------------------------------------
  array = new constructor([1, 2, 3, 1, 2, 3, 1, 2, 3, 1, 2, 3]);

  // Negative cases.
  arktest.assertEQ(-1, new constructor([]).lastIndexOf(1));
  arktest.assertEQ(-1, array.lastIndexOf(1, -17));

  arktest.assertEQ(9, array.lastIndexOf(1));
  // Index out of range.
  arktest.assertEQ(9, array.lastIndexOf(1, array.length));
  // Index in range.
  arktest.assertEQ(0, array.lastIndexOf(1, 2));
  arktest.assertEQ(3, array.lastIndexOf(1, 4));
  arktest.assertEQ(3, array.lastIndexOf(1, 3));
  // Negative index in range.
  arktest.assertEQ(0, array.lastIndexOf(1, -11));

  // Basic TypedArray function properties
  arktest.assertEQ(1, array.lastIndexOf.length);
  arktest.expectThrow(function(){ array.lastIndexOf.call([1], 1); }, ((e: Error): boolean => e instanceof TypeError));
  Object.defineProperty(array, 'length', {value: 1});
  arktest.assertEQ(array.lastIndexOf(2), 10);
  // Openharmony only support strict mode.
  // Only object properties with configurable set to true can be deleted.
  // Revise use cases to adapt to openharmony.
  // delete array.length;

  // Index of infinite value
  array = new constructor([NaN, 2, 3, +Infinity, -Infinity, 5, 6]);
  if (constructor == Float32Array || constructor == Float64Array) {
    arktest.assertEQ(3, array.lastIndexOf(Infinity));
    arktest.assertEQ(4, array.lastIndexOf(-Infinity));
  } else {
    arktest.assertEQ(-1, array.lastIndexOf(Infinity));
    arktest.assertEQ(-1, array.lastIndexOf(-Infinity));
  }
  arktest.assertEQ(-1, array.lastIndexOf(NaN));

  // Detached Operation
  let array = new constructor([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
  ArkTools.arrayBufferDetach(array.buffer);
  arktest.expectThrow(() => array.lastIndexOf(tmp), ((e: Error): boolean => e instanceof TypeError));
}
