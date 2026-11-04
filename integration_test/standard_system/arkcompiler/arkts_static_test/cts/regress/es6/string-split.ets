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

const pattern = {toString: () => ''};
const limit = { value: 3 };
pattern[Symbol.split] = function(string, limit) {
  return string.length * limit.value;
};
// Check object coercible fails.
arktest.expectThrow(() => String.prototype.split.call(null, pattern, limit),
             TypeError);
// Override is called.
arktest.assertEQ(15, 'abcde'.split(pattern, limit));
// Non-callable override.
pattern[Symbol.split] = 'dumdidum';
arktest.expectThrow(() => 'abcde'.split(pattern, limit), ((e: Error): boolean => e instanceof TypeError));
// Null override.
pattern[Symbol.split] = null;
arktest.assertEQ(['a', 'b', 'c', 'd', 'e'], 'abcde'.split(pattern));

arktest.assertEQ('[Symbol.split]', RegExp.prototype[Symbol.split].name);
