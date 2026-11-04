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

let lengthCalled = false;
function lengthValue() {
  arktest.assertFalse(lengthCalled);
  lengthCalled = true;
  return 5;
}

// ToLength should convert these to usable lengths.
const goodNonIntegerLengths = [
  function() { return 4.6; },
  function() { return -5; },
  function() { return NaN; },
  function() { return '5'; },
  function() { return 'abc'; },
  function() { return true; },
  function() { return null; },
  function() { return undefined; }
];

// This will fail if you use ToLength on it.
function badNonIntegerLength() {
  return Symbol('5');
}

for (let constructor of typedArrayConstructors) {
  lengthCalled = false;
  const a = new constructor(10);
  a.set({length: {valueOf: lengthValue}});
  arktest.assertTrue(lengthCalled);

  for (let lengthFun of goodNonIntegerLengths) {
    a.set({length: {valueOf: lengthFun}});
  }

  arktest.expectThrow(function() {
    a.set({length: {valueOf: badNonIntegerLength}});
  }, ((e: Error): boolean => e instanceof TypeError));
}
