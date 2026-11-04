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

const descriptor = { get: function() { throw new Error('accessed length'); } };

for (let constructor of typedArrayConstructors) {
  const differentConstructor =
    constructor === Uint8Array ? Int8Array : Uint8Array;
  const target = new constructor(16);
  Object.defineProperty(target, 'length', descriptor);

  const sameBuffer = new differentConstructor(target.buffer, 0, 2);
  Object.defineProperty(sameBuffer, 'length', descriptor);
  target.set(sameBuffer);

  const differentBuffer = new differentConstructor(16);
  Object.defineProperty(differentBuffer, 'length', descriptor);
  target.set(differentBuffer);

  const array = [0, 1, 2];
  target.set(array);
}
