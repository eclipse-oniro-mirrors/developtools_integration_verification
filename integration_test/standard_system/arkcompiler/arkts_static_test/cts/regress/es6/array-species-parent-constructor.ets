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

Object.getOwnPropertyDescriptor(() => {}, 'prototype');


// Overwriting Array.prototype.constructor updates the protector

let x = [];

arktest.assertEQ(Array, x.map(()=>{}).constructor);
arktest.assertEQ(Array, x.filter(()=>{}).constructor);
arktest.assertEQ(Array, x.slice().constructor);
arktest.assertEQ(Array, x.splice().constructor);
arktest.assertEQ(Array, x.concat([1]).constructor);
arktest.assertEQ(1, x.concat([1])[0]);

class MyArray extends Array { }

Array.prototype.constructor = MyArray;
arktest.assertFalse(ArkTools.arraySpeciesProtector());

arktest.assertEQ(MyArray, x.map(()=>{}).constructor);
arktest.assertEQ(MyArray, x.filter(()=>{}).constructor);
arktest.assertEQ(MyArray, x.slice().constructor);
arktest.assertEQ(MyArray, x.splice().constructor);
arktest.assertEQ(MyArray, x.concat([1]).constructor);
arktest.assertEQ(1, x.concat([1])[0]);
