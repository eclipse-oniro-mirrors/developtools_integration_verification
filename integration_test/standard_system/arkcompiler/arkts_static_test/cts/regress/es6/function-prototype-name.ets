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
expected_out_1: "Semantic error ESE0087: Property 'prototype' does not exist on type 'Function'"
---*/

const condition: boolean = Function.prototype.name === '';
arktest.assertTrue(condition);

let descr = Object.getOwnPropertyDescriptor(Function.prototype, 'name');
arktest.assertFalse(descr.enumerable);
arktest.assertTrue(descr.configurable);
arktest.assertFalse(descr.writable);
arktest.assertEQ('', descr.value);
