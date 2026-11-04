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

// Test that the methods for different typedArray types have the same
// identity.

/*---
tags: [compile-only, negative]
expected_out_1: "Syntax error ESY0318: Class cannot be used as object."
---*/

'use strict';

let typedArrayConstructors = [
  Uint8Array,
  Int8Array,
  Uint16Array,
  Int16Array,
  Uint32Array,
  Int32Array,
  Uint8ClampedArray,
  Float32Array,
  Float64Array];

let typedArray = Uint8Array.__proto__;
let typedArrayPrototype = typedArray.prototype;

arktest.assertEQ(typedArray.__proto__, Function.prototype);
arktest.assertEQ(typedArrayPrototype.__proto__, Object.prototype);

// There are extra own class properties due to it simply being a function
let classProperties = new Set([
  'length', 'name', 'arguments', 'caller', 'prototype', 'BYTES_PER_ELEMENT'
]);
let instanceProperties = new Set(['BYTES_PER_ELEMENT', 'constructor', 'prototype']);

function functionProperties(object) {
  return Object.getOwnPropertyNames(object).filter(function(name) {
    return typeof Object.getOwnPropertyDescriptor(object, name).value ==
        'function' && name != 'constructor' &&
        name != 'subarray';
  });
}

let typedArrayMethods = functionProperties(Uint8Array.prototype);
let typedArrayClassMethods = functionProperties(Uint8Array);

for (let constructor of typedArrayConstructors) {
  for (let property of Object.getOwnPropertyNames(constructor.prototype)) {
    arktest.assertTrue(instanceProperties.has(property), property);
  }
  for (let property of Object.getOwnPropertyNames(constructor)) {
    arktest.assertTrue(classProperties.has(property), property);
  }
}

// Abstract ArkTools.typedArray% class can't be constructed directly

arktest.expectThrow(() => new typedArray(), ((e: Error): boolean => e instanceof TypeError));

// The "prototype" property is nonconfigurable, nonenumerable, nonwritable,
// both for ArkTools.typedArray% and for all subclasses

let desc = Object.getOwnPropertyDescriptor(typedArray, 'prototype');
arktest.assertFalse(desc.writable);
arktest.assertFalse(desc.configurable);
arktest.assertFalse(desc.enumerable);

for (let constructor of typedArrayConstructors) {
  let desc = Object.getOwnPropertyDescriptor(constructor, 'prototype');
  arktest.assertFalse(desc.writable);
  arktest.assertFalse(desc.configurable);
  arktest.assertFalse(desc.enumerable);
}
