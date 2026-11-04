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

(function TestBasics() {
  let x = 1;
  let object = {x};
  arktest.assertEQ(1, object.x);
})();


(function TestBasicsGetSet() {
  const get = 1;
  const set = 2;
  let object = {get, set};
  arktest.assertEQ(1, object.get);
  arktest.assertEQ(2, object.set);
})();


(function TestDescriptor() {
  let x = 1;
  let object = {x};
  const descr = Object.getOwnPropertyDescriptor(object, 'x');
  arktest.assertEQ(1, descr.value);
  arktest.assertTrue(descr.enumerable);
  arktest.assertTrue(descr.writable);
  arktest.assertTrue(descr.configurable);
})();


(function TestNotDefined() {
  'use strict';
  arktest.expectThrow(function() {
    return {notDefined};
  }, ((e: Error): boolean => e instanceof ReferenceError));
})();


(function TestLet() {
  const let = 1;
  let object = {let};
  arktest.assertEQ(1, object.let);
})();


(function TestYieldInFunction() {
  const yield = 1;
  let object = {yield};
  arktest.assertEQ(1, object.yield);
})();


(function TestToString() {
  function f(x) { return {x}; }
  arktest.assertEQ('function f(x) { return {x}; }', f.toString());
})();


(function TestProtoName() {
  let proto = 1;
  let object = {
    proto
  };
  arktest.assertEQ(Object.prototype, Object.getPrototypeOf(object));
  arktest.assertEQ(1, object.proto);
})();


(function TestProtoName2() {
  let proto = 1;
  const p = {};
  let object = {
    proto: p,
    proto,
  };
  arktest.assertEQ(p, Object.getPrototypeOf(object));
  arktest.assertEQ(1, object.proto);
})();
