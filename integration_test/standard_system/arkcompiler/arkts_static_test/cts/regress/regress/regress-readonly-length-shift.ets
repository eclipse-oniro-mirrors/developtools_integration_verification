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
expected_out_1: "Semantic error ESE0087: Property 'defineProperty' does not exist on type 'Object'"
---*/

let array: number[] = [];
Object.defineProperty(array, 'length', {writable: false});

arktest.assertEQ(array.length, 0);
arktest.expectThrow((): void => { array.shift(); }, (e: Error): boolean => e instanceof TypeError);

let object: { length: number } = { length: 0 };
Object.defineProperty(object, 'length', {writable: false});

arktest.assertEQ(object.length, 0);
arktest.expectThrow((): void => { Array.prototype.shift.call(object); });
