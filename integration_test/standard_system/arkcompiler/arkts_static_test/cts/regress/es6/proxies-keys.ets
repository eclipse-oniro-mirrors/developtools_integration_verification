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

(function testObjectKeys() {
  let target = {
    target: 1
  };
  target.__proto__ = {
    target_proto: 2
  };

  const handler = {
    ownKeys: function(target) {
      return ['foo', 'bar', Symbol('baz'), 'non-enum', 'not-found'];
    },
    getOwnPropertyDescriptor: function(target, name) {
      if (name == 'non-enum') {
        return {configurable: true};
      }
      if (name == 'not-found') { return undefined; }
      return {enumerable: true, configurable: true};
    }
  }

  let proxy = new Proxy(target, handler);

  // Object.keys() ignores symbols and non-enumerable keys.
  arktest.assertEQ(['foo', 'bar'], Object.keys(proxy));

  // Edge case: no properties left after filtering.
  handler.getOwnPropertyDescriptor = undefined;
  arktest.assertEQ([], Object.keys(proxy));

  // Throwing shouldn't crash.
  handler.getOwnPropertyDescriptor = function() { throw Object(1); };
  arktest.expectThrow(() => Object.keys(proxy), Number);

  // Fall through to getOwnPropertyDescriptor if there is no trap.
  handler.ownKeys = undefined;
  arktest.expectThrow(() => Object.keys(proxy), Number);

  // Fall through to target if there is no trap.
  handler.getOwnPropertyDescriptor = undefined;
  arktest.assertEQ(['target'], Object.keys(proxy));
  arktest.assertEQ(['target'], Object.keys(target));

  const proxy2 = new Proxy(proxy, {});
  arktest.assertEQ(['target'], Object.keys(proxy2));
})();

(function testForSymbols() {
  const symbol = Symbol();
  const p = new Proxy({}, {ownKeys() { return ['1', symbol, '2'] }});
  arktest.assertEQ(['1','2'], Object.getOwnPropertyNames(p));
  arktest.assertEQ([symbol], Object.getOwnPropertySymbols(p));
})();

(function testNoProxyTraps() {
  const testSym = Symbol('sym1');
  const testSym2 = Symbol('sym2');
  let target = {
    one: 1,
    two: 2,
    [testSym]: 4,
    0: 0,
  };
  Object.defineProperty(
      target, 'non-enum',
      { enumerable: false, value: 'nope', configurable: true, writable: true });
  target.__proto__ = {
    target_proto: 3,
    1: 1,
    [testSym2]: 5
  };
  Object.defineProperty(
      target.__proto__, 'non-enum2',
      { enumerable: false, value: 'nope', configurable: true, writable: true });
  let proxy = new Proxy(target, {});

  arktest.assertEQ(['0', 'one', 'two'], Object.keys(proxy));
  arktest.assertEQ(['0', 'one', 'two', 'non-enum'],
               Object.getOwnPropertyNames(proxy));
  arktest.assertEQ([testSym], Object.getOwnPropertySymbols(proxy));
})();
