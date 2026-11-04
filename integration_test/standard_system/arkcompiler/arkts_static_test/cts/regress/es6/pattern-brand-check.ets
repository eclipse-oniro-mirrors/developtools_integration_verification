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
expected_out_1: "Syntax error ESY0194: Parameter declaration should have an explicit type annotation."
---*/

function createNonRegExp(calls) {
  return {
    get [Symbol.match]() {
      calls.push('@@match');
      return undefined;
    },
    get [Symbol.replace]() {
      calls.push('@@replace');
      return undefined;
    },
    get [Symbol.search]() {
      calls.push('@@search');
      return undefined;
    },
    get [Symbol.split]() {
      calls.push('@@split');
      return undefined;
    },
    [Symbol.toPrimitive]() {
      calls.push('@@toPrimitive');
      return '';
    }
  };
}

(function testStringMatchBrandCheck() {
  let calls = [];
  ''.match(createNonRegExp(calls));
  arktest.assertEQ(['@@match', '@@toPrimitive'], calls);
})();

(function testStringSearchBrandCheck() {
  let calls = [];
  ''.search(createNonRegExp(calls));
  arktest.assertEQ(['@@search', '@@toPrimitive'], calls);
})();

(function testStringSplitBrandCheck() {
  let calls = [];
  ''.split(createNonRegExp(calls));
  arktest.assertEQ(['@@split', '@@toPrimitive'], calls);
})();

(function testStringReplaceBrandCheck() {
  let calls = [];
  ''.replace(createNonRegExp(calls), '');
  arktest.assertEQ(['@@replace', '@@toPrimitive'], calls);
})();
