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
expected_out_1: "Semantic error ESE0087: Property 'prototype' does not exist on type 'String'"
---*/

const repeatedZero: Any = String.prototype.repeat.call(0, 3);
arktest.assertEQ('000', repeatedZero);
arktest.assertEQ('-1-1-1', String.prototype.repeat.call(-1, 3));
arktest.assertEQ('2.12.12.1', String.prototype.repeat.call(2.1, 3));
arktest.assertEQ('', String.prototype.repeat.call([], 3));
arktest.assertEQ('1,2,3', String.prototype.repeat.call([1, 2, 3], 1));
arktest.assertEQ('true', String.prototype.repeat.call(true, 1));
arktest.assertEQ('false', String.prototype.repeat.call(false, 1));
arktest.assertEQ('[object Object]', String.prototype.repeat.call({}, 1));

arktest.assertEQ('000', String.prototype.repeat.apply(0, [3]));
arktest.assertEQ('-1-1-1', String.prototype.repeat.apply(-1, [3]));
arktest.assertEQ('2.12.12.1', String.prototype.repeat.apply(2.1, [3]));
arktest.assertEQ('', String.prototype.repeat.apply([], [3]));
arktest.assertEQ('1,2,3', String.prototype.repeat.apply([1, 2, 3], [1]));
arktest.assertEQ('true', String.prototype.repeat.apply(true, [1]));
arktest.assertEQ('false', String.prototype.repeat.apply(false, [1]));
arktest.assertEQ('[object Object]', String.prototype.repeat.apply({}, [1]));

const georgianCharacter = String.fromCharCode(4312);
arktest.assertEQ(georgianCharacter + georgianCharacter + georgianCharacter,
                 georgianCharacter.repeat(3));

// Openharmony not support eval, Comment out the following testcases.

// Test cases found in FF
arktest.assertEQ('abc', 'abc'.repeat(1));
arktest.assertEQ('abcabc', 'abc'.repeat(2));
arktest.assertEQ('abcabcabc', 'abc'.repeat(3));
arktest.assertEQ('aaaaaaaaaa', 'a'.repeat(10));
arktest.assertEQ('', ''.repeat(5));
arktest.assertEQ('', 'abc'.repeat(0));
arktest.assertEQ('abcabc', 'abc'.repeat(2.0));

arktest.assertEQ('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'a'.repeat(37));
arktest.assertEQ('', 'a'.repeat(NaN));
// Openharmony not support eval, Comment out the following testcases.

// Handling empty strings
// Openharmony not support eval, Comment out the following testcases.
arktest.assertEQ('', ''.repeat(Math.pow(2, 30)));
arktest.assertEQ('', ''.repeat(Math.pow(2, 40)));

const myobj = {
  toString: function() {
    return 'abc';
  },
  repeat : String.prototype.repeat
};
arktest.assertEQ('abc', myobj.repeat(1));
arktest.assertEQ('abcabc', myobj.repeat(2));
