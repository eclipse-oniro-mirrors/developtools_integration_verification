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
expected_out_1: "Syntax error ESY0016: Unexpected token."
---*/

const pattern = {
  [Symbol.replace]: (string, newValue) => string + newValue,
  toString: () => 'c'
};
// Check object coercible fails.
arktest.expectThrow(() => String.prototype.replace.call(null, pattern, 'x'),
             TypeError);
// Override is called.
arktest.assertEQ('abcdex', 'abcde'.replace(pattern, 'x'));
// Non-callable override.
pattern[Symbol.replace] = 'dumdidum';
arktest.expectThrow(() => 'abcde'.replace(pattern, 'x'), ((e: Error): boolean => e instanceof TypeError));
// Null override.
pattern[Symbol.replace] = null;
arktest.assertEQ('abXde', 'abcde'.replace(pattern, 'X'));

arktest.assertEQ('[Symbol.replace]', RegExp.prototype[Symbol.replace].name);

// Openharmony throw message is 'this is not Object'.
// 'Method RegExp.prototype.@@replace called on incompatible receiver xyz' => 'this is not Object'
arktest.expectThrow(
    () => { RegExp.prototype[Symbol.replace].call('xyz', 'foo', 'a'); },
    (e: Error): boolean => e instanceof TypeError && e.message == 'this is not Object');
