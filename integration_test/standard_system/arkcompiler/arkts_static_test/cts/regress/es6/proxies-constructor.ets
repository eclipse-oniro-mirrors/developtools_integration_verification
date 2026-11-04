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

(function testNewTarget() {
  arktest.expectThrow(function(){ Proxy({}, {}); }, ((e: Error): boolean => e instanceof TypeError));
  arktest.expectNoThrow(function(){ new Proxy({}, {}); });
})();

(function testNonObjectTargetTypes() {
  arktest.expectThrow(function(){ new Proxy(undefined, {}); }, ((e: Error): boolean => e instanceof TypeError));

  arktest.expectThrow(function(){ new Proxy(null, {}); }, ((e: Error): boolean => e instanceof TypeError));

  arktest.expectThrow(function(){ new Proxy('', {}); }, ((e: Error): boolean => e instanceof TypeError));

  arktest.expectThrow(function(){ new Proxy(0, {}); }, ((e: Error): boolean => e instanceof TypeError));

  arktest.expectThrow(function(){ new Proxy(0.5, {}); }, ((e: Error): boolean => e instanceof TypeError));

  arktest.expectThrow(function(){ new Proxy(false, {}); }, ((e: Error): boolean => e instanceof TypeError));
})();


(function testNonObjectHandlerTypes() {
  arktest.expectThrow(function(){ new Proxy({}, undefined); }, ((e: Error): boolean => e instanceof TypeError));

  arktest.expectThrow(function(){ new Proxy({}, null); }, ((e: Error): boolean => e instanceof TypeError));

  arktest.expectThrow(function(){ new Proxy({}, ''); }, ((e: Error): boolean => e instanceof TypeError));

  arktest.expectThrow(function(){ new Proxy({}, 0); }, ((e: Error): boolean => e instanceof TypeError));

  arktest.expectThrow(function(){ new Proxy({}, 0.5); }, ((e: Error): boolean => e instanceof TypeError));

  arktest.expectThrow(function(){ new Proxy({}, false); }, ((e: Error): boolean => e instanceof TypeError));
})();


(function testConstructionWithoutArguments() {
  arktest.expectThrow(function(){ new Proxy(); }, ((e: Error): boolean => e instanceof TypeError));

  arktest.expectThrow(function(){ new Proxy(42); }, ((e: Error): boolean => e instanceof TypeError));

  arktest.expectThrow(function(){ new Proxy({}); }, ((e: Error): boolean => e instanceof TypeError));
})();


(function testConstructionFromArray() {
  let p = new Proxy([42], {});
  arktest.assertTrue(p instanceof Array);
  arktest.assertEQ(p[0], 42);
})();


(function testConstructionFromObject() {
  let p = new Proxy({
    prop: 42
  }, {});
  arktest.assertTrue(p instanceof Object);
  arktest.assertEQ(p.prop, 42);
})();


(function testConstructionFromCallable() {
  let p = new Proxy(() => { return 42; }, {});
  arktest.assertTrue(p instanceof Function);
  arktest.assertEQ(p(), 42);
})();


(function testConstructionFromConstructor() {
  class Foo {};
  let p = new Proxy(Foo, {});
  arktest.assertTrue(p instanceof Function);
  arktest.assertTrue(new p() instanceof Foo);
})();


(function testConstructionFromProxy() {
  const q = new Proxy({}, {});
  let p = new Proxy(q, {});
  arktest.assertTrue(p instanceof Object);
})();
