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

'use strict';

function shouldNotBeCalled() {
  throw new Error('should not be called');
}

(function() {
  let r = new RegExp('biep');
  arktest.assertTrue(r === RegExp(r));
  arktest.assertFalse(r === new RegExp(r));
  r[Symbol.match] = false;
  Object.defineProperty(r, 'source', {get: shouldNotBeCalled});
  Object.defineProperty(r, 'flags', {get: shouldNotBeCalled});
  arktest.assertFalse(r === RegExp(r));
})();

(function() {
  let allow = false;
  class A extends RegExp {
    get source() {
      if (!allow) { throw new Error('should not be called'); }
      return super.source;
    }
    get flags() {
      if (!allow) { throw new Error('should not be called'); }
      return super.flags
    }
  }

  let r = new A('biep');
  let r2 = RegExp(r);

  arktest.assertFalse(r === r2);
  allow = true;
  arktest.assertEQ(r, r2);
  allow = false;
  arktest.assertTrue(A.prototype === r.__proto__);
  arktest.assertTrue(RegExp.prototype === r2.__proto__);

  const r3 = RegExp(r);
  arktest.assertFalse(r3 === r);
  allow = true;
  arktest.assertEQ(r3, r);
  allow = false;

  const r4 = new A(r2);
  arktest.assertFalse(r4 === r2);
  allow = true;
  arktest.assertEQ(r4, r2);
  allow = false;
  arktest.assertTrue(A.prototype === r4.__proto__);

  r[Symbol.match] = false;
  const r5 = new A(r);
  arktest.assertFalse(r5 === r);
  allow = true;
  arktest.assertEQ(r5, r);
  allow = false;
  arktest.assertTrue(A.prototype === r5.__proto__);
})();

(function() {
  let log = [];
  let match = {
    get source() { log.push('source'); return 'biep'; },
    get flags() { log.push('flags'); return 'i'; }
  };
  Object.defineProperty(match, Symbol.match,
      {get() { log.push('match'); return true; }});
  let r = RegExp(match);
  arktest.assertEQ(['match', 'source', 'flags'], log);
  arktest.assertFalse(r === match);
  arktest.assertEQ(/biep/i, r);
})();

(function() {
  let log = [];
  let match = {
    get source() { log.push('source'); return 'biep'; },
    get flags() { log.push('flags'); return 'i'; }
  };
  Object.defineProperty(match, Symbol.match,
      {get() { log.push('match'); return true; }});
  match.constructor = RegExp;
  let r = RegExp(match);
  arktest.assertEQ(['match'], log);
  arktest.assertTrue(r === match);
})();

(function() {
  let r = RegExp('biep', 'i');
  r[Symbol.match] = false;
  let r2 = RegExp(r, 'g');
  arktest.assertFalse(r === r2);
  arktest.assertEQ(/biep/i, r);
  arktest.assertEQ(/biep/g, r2);
})();

(function() {
  class A extends RegExp {
    get ['constructor']() { log.push('constructor'); return RegExp; }
  }
  let r = new A('biep');
  let log = [];
  let r2 = RegExp(r);
  arktest.assertEQ(['constructor'], log);
  arktest.assertTrue(r === r2);
})();
