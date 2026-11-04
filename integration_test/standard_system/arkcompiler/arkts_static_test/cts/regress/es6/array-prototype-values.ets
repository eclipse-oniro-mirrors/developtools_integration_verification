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
expected_out_1: "Semantic error ESE0087: Property 'getOwnPropertyDescriptor' does not exist on type 'Object'"
---*/

Object.getOwnPropertyDescriptor(() => {}, 'values');

// Functionality of the values iterator is tested elsewhere; this test
// merely verifies that the 'values' property is set up correctly.
const valuesDesc = Object.getOwnPropertyDescriptor(Array.prototype, 'values');
arktest.assertEQ('object', typeof valuesDesc);
arktest.assertEQ(Array.prototype[Symbol.iterator], valuesDesc.value);
arktest.assertTrue(valuesDesc.configurable);
arktest.assertTrue(valuesDesc.writable);
arktest.assertFalse(valuesDesc.enumerable);
arktest.assertTrue(Array.prototype[Symbol.unscopables].values);
arktest.expectThrow(() => new Array.prototype[Symbol.iterator], ((e: Error): boolean => e instanceof TypeError));
