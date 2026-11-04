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

// Test that changing the generic descriptor flags on a property
// on the global object doesn't break invariants.

/*---
tags: [compile-only, negative]
expected_out_1: "Semantic error ESE0087: Property 'defineProperty' does not exist on type 'Object'"
---*/

Object.defineProperty(globalThis, 'Object', {enumerable: true});

let desc = Object.getOwnPropertyDescriptor(globalThis, 'Object');
arktest.assertTrue(desc.enumerable);
arktest.assertTrue(desc.configurable);
arktest.assertFalse(desc.hasOwnProperty('get'));
arktest.assertFalse(desc.hasOwnProperty('set'));
arktest.assertTrue(desc.hasOwnProperty('value'));
arktest.assertTrue(desc.writable);
