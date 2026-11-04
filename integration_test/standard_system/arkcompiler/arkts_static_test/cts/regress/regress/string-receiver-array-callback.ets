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

// Regression test for correct handling of non-object receiver values
// passed to built-in array functions.

/*---
tags: [compile-only, negative]
expected_out_1: "Semantic error ESE0087: Property 'prototype' does not exist on type 'String'"
---*/

String.prototype.isThatMe = function () {
  arktest.assertFalse(this === str);
};

let str = 'abc';
str.isThatMe();
str.isThatMe.call(str);

const arr = [1];
arr.forEach(''.isThatMe, str);
arr.filter(''.isThatMe, str);
arr.some(''.isThatMe, str);
arr.every(''.isThatMe, str);
arr.map(''.isThatMe, str);

(() => {
function foo(): void {
  try {
    String.prototype.length.x();
  } catch (e) {
  }
}

foo();
foo();
foo();
})();
