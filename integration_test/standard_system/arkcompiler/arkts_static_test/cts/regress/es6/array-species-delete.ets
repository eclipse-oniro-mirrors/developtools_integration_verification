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
expected_out_1: "Semantic error ESE0169: Type '*ERROR_TYPE*' is not generic."
---*/

let array: int[] = []; array['constructor'];


// Overwriting the constructor of an instance updates the protector

let x = [];

arktest.assertEQ(Array, x.map(()=>{}).constructor);
arktest.assertEQ(Array, x.filter(()=>{}).constructor);
arktest.assertEQ(Array, x.slice().constructor);
arktest.assertEQ(Array, x.splice().constructor);
arktest.assertEQ(Array, x.concat([1]).constructor);
arktest.assertEQ(1, x.concat([1])[0]);

(() => {
let array: int[] = []; array['constructor'];

let x = [];
let deleteCount;

x.constructor = function() {};
x.constructor[Symbol.species] = function(param) {
  deleteCount = param;
};

x.splice(0, -0);

arktest.assertEQ(0, deleteCount);
})();
