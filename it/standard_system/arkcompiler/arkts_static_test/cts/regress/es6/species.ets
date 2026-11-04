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

// Test the ES2015 @@species feature

/*---
tags: [compile-only, negative]
expected_out_1: "Semantic error ESE0087: Property '__proto__' does not exist on type 'Uint8Array'"
---*/

'use strict';

let typedArray = Uint8Array.__proto__;

// The @@species property exists on the right objects and has the right values

let classesWithSpecies = [RegExp, Array, typedArray, ArrayBuffer, Map, Set, Promise];
let classesWithoutSpecies = [Object, Function, String, Number, Symbol, WeakMap, WeakSet];

for (let constructor of classesWithSpecies) {
  arktest.assertEQ(constructor, constructor[Symbol.species]);
  arktest.expectThrow(
    function() { constructor[Symbol.species] = undefined },
    ((e: Error): boolean => e instanceof TypeError)
  );
  let descriptor = Object.getOwnPropertyDescriptor(constructor, Symbol.species);
  arktest.assertTrue(descriptor.configurable);
  arktest.assertFalse(descriptor.enumerable);
  arktest.assertEQ(undefined, descriptor.writable);
  arktest.assertEQ(undefined, descriptor.set);
  arktest.assertEQ('function', typeof descriptor.get);
}

// @@species is defined with distinct getters
arktest.assertEQ(classesWithSpecies.length,
             new Set(classesWithSpecies.map(constructor =>
                                            Object.getOwnPropertyDescriptor(
                                              constructor, Symbol.species).get)
                ).size);

for (let constructor of classesWithoutSpecies) {
  arktest.assertEQ(undefined, constructor[Symbol.species]);
  }
