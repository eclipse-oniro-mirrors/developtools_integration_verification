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
expected_out_1: "Semantic error ESE0127: No matching indexing signature for $_get(Symbol.iterator)"
---*/

(() => {
const iterator = 'ott'[Symbol.iterator]();

iterator.__proto__.fonts = {};
arktest.assertTrue(ArkTools.stringIteratorProtector());
iterator.__proto__[0] = 0;
arktest.assertTrue(ArkTools.stringIteratorProtector());
})();


// Tests for wrapped strings.

const str = Object('ott');
arktest.assertTrue(ArkTools.stringIteratorProtector());
arktest.assertEQ(['o', 't', 't'], [...str]);

function iteratorFn() {
  return {next : () => ({value : undefined, done : true})};
};

str[Symbol.iterator] = iteratorFn;
// This shouldn't invalidate the protector, because it doesn't support String
// objects.
arktest.assertTrue(ArkTools.stringIteratorProtector());
arktest.assertEQ([], [...str]);


const str2 = Object('ott');
arktest.assertEQ(['o', 't', 't'], [...str2]);
// This changes the String prototype. No more tests should be run after this in
// the same instance.
str2.__proto__[Symbol.iterator] = iteratorFn;
arktest.assertFalse(ArkTools.stringIteratorProtector());
arktest.assertEQ([], [...str2]);
