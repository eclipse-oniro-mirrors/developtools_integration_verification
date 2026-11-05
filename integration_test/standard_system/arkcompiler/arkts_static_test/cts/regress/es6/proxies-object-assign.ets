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
  Semantic error ESE0174: Cannot infer type for handler because class composite
  needs an explicit target type
---*/

const handler = {
  ownKeys: function(t) { return ['a', 'b']; },
  getOwnPropertyDescriptor: function(t, p) {
    return {enumerable: true, configurable: true}
  },
  get: function(t, p) {
    return 1;
  }
};

const proxy = new Proxy({}, handler);

const o = {};

Object.assign(o, proxy);

arktest.assertEQ({'a': 1, 'b': 1}, o);

(function TestStringSources() {
  const source = 'abc';
  const target = {};
  Object.assign(target, source);
  arktest.assertEQ({0: 'a', 1: 'b', 2: 'c'}, target);
})();
