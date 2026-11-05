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

let typedArrayConstructors = [
  Float64Array,
  Float32Array,
  Uint32Array,
  Int32Array,
  Uint16Array,
  Int16Array,
  Uint8Array,
  Uint8ClampedArray,
  Int8Array,
];

// Test KeyedStore in uninitialized and monomorphic states.
for (let C of typedArrayConstructors) {
  let keyedSta = function(array) {
    let didRun = false;
    array[0] = {
      valueOf() {
        didRun = true;
        return 42;
      }
    };

    return { didRun, array };
  };

  for (let i = 0; i < 3; ++i) {
    let { didRun, array } = keyedSta(new C(1));
    arktest.assertTrue(didRun);
    arktest.assertEQ(array[0], 42);

    // OOB store
    // FIXME: Throw a TypeError when storing OOB in a TypedArray.
    let { didRun } = keyedSta(new C);
    arktest.assertTrue(didRun);
  }
}

// Test KeyedStore in polymorphic and megamorphic states.
do {
  let keyedSta = function(array) {
    let didRun = false;
    array[0] = {
      valueOf() {
        didRun = true;
        return 42;
      }
    };

    return { didRun, array };
  };

  for (let i = 0; i < 3; ++i) {
    for (let C of typedArrayConstructors) {
      let { didRun, array } = keyedSta(new C(1));
      arktest.assertTrue(didRun);
      arktest.assertEQ(array[0], 42);

      // OOB store
      // FIXME: Throw a TypeError when storing OOB in a TypedArray.
      let { didRun } = keyedSta(new C);
      arktest.assertTrue(didRun);
    }
  }
} while (false);
