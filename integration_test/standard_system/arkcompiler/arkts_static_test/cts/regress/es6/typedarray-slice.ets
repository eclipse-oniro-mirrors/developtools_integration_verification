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

for (let constructor of typedArrayConstructors) {
  // Check various variants of empty array's slicing.
  let array = new constructor(0);
  for (let i = 0; i < 7; i++) {
    arktest.assertEQ(0, array.slice(0, 0).length);
    arktest.assertEQ(0, array.slice(1, 0).length);
    arktest.assertEQ(0, array.slice(0, 1).length);
    arktest.assertEQ(0, array.slice(-1, 0).length);
  }


  // Check various forms of arguments omission.
  array = new constructor(7);

  for (let i = 0; i < 7; i++) {
    arktest.assertEQ(array, array.slice());
    arktest.assertEQ(array, array.slice(0));
    arktest.assertEQ(array, array.slice(undefined));
    arktest.assertEQ(array, array.slice('foobar'));
    arktest.assertEQ(array, array.slice(undefined, undefined));
  }


  // Check variants of negatives and positive indices.
  array = new constructor(7);

  arktest.assertEQ(7, array.slice(-100).length);
  arktest.assertEQ(3, array.slice(-3).length);
  arktest.assertEQ(3, array.slice(4).length);
  arktest.assertEQ(1, array.slice(6).length);
  arktest.assertEQ(0, array.slice(7).length);
  arktest.assertEQ(0, array.slice(8).length);
  arktest.assertEQ(0, array.slice(100).length);

  arktest.assertEQ(0, array.slice(0, -100).length);
  arktest.assertEQ(4, array.slice(0, -3).length);
  arktest.assertEQ(4, array.slice(0, 4).length);
  arktest.assertEQ(6, array.slice(0, 6).length);
  arktest.assertEQ(7, array.slice(0, 7).length);
  arktest.assertEQ(7, array.slice(0, 8).length);
  arktest.assertEQ(7, array.slice(0, 100).length);

  // Does not permit being called on other types
  arktest.expectThrow(
    () => constructor.prototype.slice.call([], 0, 0),
    ((e: Error): boolean => e instanceof TypeError)
  );

  // Check that elements are copied properly in slice
  array = new constructor([1, 2, 3, 4]);
  const slice = array.slice(1, 3);
  arktest.assertEQ(2, slice.length);
  arktest.assertEQ(2, slice[0]);
  arktest.assertEQ(3, slice[1]);
  arktest.assertTrue(slice instanceof constructor);

  // Detached Operation
  const tmp = {
    [Symbol.toPrimitive]() {
      arktest.assertTrue(false, 'Parameter should not be processed when ' +
                        'array.[[ViewedArrayBuffer]] is detached.');
      return 0;
    }
  };
  let array = new constructor([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
  ArkTools.arrayBufferDetach(array.buffer);
  arktest.expectThrow(() => array.slice(tmp, tmp), ((e: Error): boolean => e instanceof TypeError));

  // Check that the species array must be a typed array
  class MyTypedArray extends constructor {
    static get[Symbol.species]() {
      return Array;
    }
  }
  const arr = new MyTypedArray([-1.0, 0, 1.1, 255, 256]);
  arktest.expectThrow(() => arr.slice(), ((e: Error): boolean => e instanceof TypeError));
}
