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
expected_out_1: "Syntax error ESY0320: Function expressions are not supported, use arrow functions instead"
---*/

(function testConcatRevokedProxyToArrayInPrototype() {
  'use strict';
  let handler = {
    get(_, name) {
      if (name === Symbol.isConcatSpreadable) {
        p.revoke();
      }
      return target[name];
    }
  }

  let p = Proxy.revocable([], handler);
  let target = { __proto__: p.proxy };
  arktest.expectThrow(function() { [].concat(target); }, ((e: Error): boolean => e instanceof TypeError));
})();

(function testConcatRevokedProxyToArray() {
  'use strict';
  let handler = {
    get(_, name) {
      if (name === Symbol.isConcatSpreadable) {
        p.revoke();
      }
      return target[name];
    }
  }

  let target = [];
  let p = Proxy.revocable(target, handler);
  arktest.expectThrow(function() { [].concat(p.proxy); }, ((e: Error): boolean => e instanceof TypeError));
})();
