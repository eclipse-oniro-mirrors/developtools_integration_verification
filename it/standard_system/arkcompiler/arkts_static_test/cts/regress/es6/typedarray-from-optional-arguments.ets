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

function assertArrayLikeEquals(value, expected, type) {
  arktest.assertEQ(value.__proto__, type.prototype);
  arktest.assertEQ(expected.length, value.length);
  for (let i = 0; i < value.length; ++i) {
    arktest.assertEQ(expected[i], value[i]);
  }
}

for (let constructor of typedArrayConstructors) {
  let ta = new constructor([1,2,3]);
  assertArrayLikeEquals(constructor.from([1,2,3]), ta, constructor);
  assertArrayLikeEquals(constructor.from([1,2,3], undefined),
                        ta, constructor);
  assertArrayLikeEquals(constructor.from([1,2,3], undefined, undefined),
                        ta, constructor);
}
