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

const throwTypeErrorFunction =
    Object.getOwnPropertyDescriptor(Function.prototype, 'arguments').get;

const nameDesc =
    Object.getOwnPropertyDescriptor(throwTypeErrorFunction, 'name');
arktest.assertFalse(nameDesc.configurable, 'configurable');
arktest.assertFalse(nameDesc.enumerable, 'enumerable');
arktest.assertFalse(nameDesc.writable, 'writable');
arktest.expectThrow(function() {
  'use strict';
  throwTypeErrorFunction.name = 'foo';
}, ((e: Error): boolean => e instanceof TypeError));

const lengthDesc =
    Object.getOwnPropertyDescriptor(throwTypeErrorFunction, 'length');
arktest.assertFalse(lengthDesc.configurable, 'configurable');
arktest.assertFalse(lengthDesc.enumerable, 'enumerable');
arktest.assertFalse(lengthDesc.writable, 'writable');
arktest.expectThrow(function() {
  'use strict';
  throwTypeErrorFunction.length = 42;
}, ((e: Error): boolean => e instanceof TypeError));

arktest.assertTrue(Object.isFrozen(throwTypeErrorFunction));
