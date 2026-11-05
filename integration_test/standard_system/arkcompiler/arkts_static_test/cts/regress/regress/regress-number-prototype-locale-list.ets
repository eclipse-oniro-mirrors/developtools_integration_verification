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
expected_out_1: "Semantic error ESE0087: Property 'prototype' does not exist on type 'Double'"
---*/

(() => {
Number.prototype.__proto__ = String.prototype;
arktest.assertEQ((123).length, 0);
})();

// Correctness issue:
// When changing the Number prototype and providing a smi as the locale for
// String.p.toLocaleLowerCase, the prototype would not be considered.
// See ecma402 #sec-canonicalizelocalelist.

let smi = 123;
let heapNumber = 1.23;

// Test case 1: The number prototype has a length property and a valid locale
// for Get(O, '0').
Number.prototype.__proto__ = ['tr'];
arktest.assertEQ('I'.toLocaleLowerCase('tr'),
             'I'.toLocaleLowerCase(smi));
arktest.assertEQ('I'.toLocaleLowerCase('tr'),
             'I'.toLocaleLowerCase(heapNumber));

// Test case 2: The number prototype has a length property and an invalid locale
// for Get(O, '0').
Number.prototype.__proto__ = [42];  // 42 is not a valid locale.
arktest.expectThrow((): void => { 'I'.toLocaleLowerCase(smi); }, (e: Error): boolean => e instanceof TypeError);
arktest.expectThrow((): void => { 'I'.toLocaleLowerCase(heapNumber); }, (e: Error): boolean => e instanceof TypeError);

// Test case 3: The number prototype has a length property of 0.
Number.prototype.__proto__ = [];
arktest.assertEQ('I'.toLocaleLowerCase([]),
             'I'.toLocaleLowerCase(smi));
arktest.assertEQ('I'.toLocaleLowerCase([]),
             'I'.toLocaleLowerCase(heapNumber));
