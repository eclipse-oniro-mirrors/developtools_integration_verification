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


// Test instanceof with proxies.

/*---
tags: [compile-only, negative]
expected_out_1: "Syntax error ESY0320: Function expressions are not supported, use arrow functions instead"
---*/

(function TestInstanceOfWithProxies() {
  function foo(x) {
    return x instanceof Array;
  }
  ArkTools.prepareFunctionForOptimization(foo);
  arktest.assertTrue(foo([]));
  arktest.assertFalse(foo({}));
  ArkTools.optimizeFunctionOnNextCall(foo);
  arktest.assertTrue(foo([]));
  arktest.assertFalse(foo({}));

  const handler = {
    getPrototypeOf: function(target) { return Array.prototype; }
  };
  let p = new Proxy({}, handler);
  arktest.assertTrue(foo(p));
  const o = {};
  o.__proto__ = p;
  arktest.assertTrue(foo(o));

  // Make sure we are also correct if the handler throws.
  handler.getPrototypeOf = function(target) {
    throw 'uncooperative';
  }
  arktest.expectThrow('foo(o)');

  // Including if the optimized function has a catch handler.
  function fooCatch(x) {
    try {
      x instanceof Array;
    } catch(e) {
      arktest.assertEQ('uncooperative', e);
      return true;
    }
    return false;
  }
  ArkTools.prepareFunctionForOptimization(fooCatch);
  arktest.assertTrue(fooCatch(o));
  ArkTools.optimizeFunctionOnNextCall(fooCatch);
  arktest.assertTrue(fooCatch(o));
  handler.getPrototypeOf = function(target) { return Array.prototype; }
  arktest.assertFalse(fooCatch(o));
})();


(function testInstanceOfWithRecursiveProxy() {
  // Make sure we gracefully deal with recursive proxies.
  let proxy = new Proxy({},{});
  proxy.__proto__ = proxy;
  // instanceof will cause an inifinite prototype walk.
  arktest.expectThrow(() => { proxy instanceof Object }, ((e: Error): boolean => e instanceof RangeError));

  const proxy2 = new Proxy({}, {getPrototypeOf() { return proxy2 }});
  arktest.expectThrow(() => { proxy instanceof Object }, ((e: Error): boolean => e instanceof RangeError));
})();
