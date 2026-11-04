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
expected_out_1: >-
  Semantic error ESE0174: Cannot infer type for pattern because class composite
  needs an explicit target type
---*/

const pattern = {};
pattern[Symbol.match] = function(string) {
  return string.length;
};
// Check object coercible fails.
arktest.expectThrow(() => String.prototype.match.call(null, pattern),
             TypeError);
// Override is called.
arktest.assertEQ(5, 'abcde'.match(pattern));
// Receiver is not converted to string if pattern has Symbol.match
const receiver = { toString(){ throw new Error(); }, length: 6 };
arktest.assertEQ(6, String.prototype.match.call(receiver, pattern));
// Non-callable override.
pattern[Symbol.match] = 'dumdidum';
arktest.expectThrow(() => 'abcde'.match(pattern), ((e: Error): boolean => e instanceof TypeError));

arktest.assertEQ('[Symbol.match]', RegExp.prototype[Symbol.match].name);

(() => {
const pattern = {};
pattern[Symbol.search] = function(string) {
  return string.length;
};
arktest.expectThrow(() => String.prototype.search.call(null, pattern),
             TypeError);
arktest.assertEQ(5, 'abcde'.search(pattern));
const receiver = { toString(){ throw new Error(); }, length: 6 };
arktest.assertEQ(6, String.prototype.search.call(receiver, pattern));
pattern[Symbol.search] = 'dumdidum';
arktest.expectThrow(() => 'abcde'.search(pattern), ((e: Error): boolean => e instanceof TypeError));

arktest.assertEQ('[Symbol.search]', RegExp.prototype[Symbol.search].name);
})();
