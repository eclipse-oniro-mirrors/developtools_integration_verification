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

// See http://crbug.com/72736

// This tests that Object.defineProperty actually allows to change the value of
// a non-writable property if configurable is true.

/*---
tags: [compile-only, negative]
expected_out_1: "Semantic error ESE0087: Property 'defineProperty' does not exist on type 'Object'"
---*/

let obj: Object = {};
Object.defineProperty(obj, 'foo', { value: 10, configurable: true });
arktest.assertEQ(obj.foo, 10);
Object.defineProperty(obj, 'foo', { value: 20, configurable: true });
arktest.assertEQ(obj.foo, 20);
