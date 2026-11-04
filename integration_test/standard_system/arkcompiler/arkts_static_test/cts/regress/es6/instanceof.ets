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

// Make sure it's an error if @@hasInstance isn't a function.

/*---
tags: [compile-only, negative]
expected_out_1: "Syntax error ESY0320: Function expressions are not supported, use arrow functions instead"
---*/

(function() {
  let f = {};
  f[Symbol.hasInstance] = null;
  arktest.expectThrow(function() { 0 instanceof f; }, ((e: Error): boolean => e instanceof TypeError));
})();

// Make sure the result is coerced to boolean.
(function() {
  let f = {};
  f[Symbol.hasInstance] = function() { return undefined; };
  arktest.assertEQ(0 instanceof f, false);
  f[Symbol.hasInstance] = function() { return null; };
  arktest.assertEQ(0 instanceof f, false);
  f[Symbol.hasInstance] = function() { return true; };
  arktest.assertEQ(0 instanceof f, true);
})();

// Make sure if @@hasInstance throws, we catch it.
(function() {
  let f = {};
  f[Symbol.hasInstance] = function() { throw new Error('always throws'); }
  try {
    0 instanceof f;
  } catch (e) {
    arktest.assertEQ(e.message, 'always throws');
  }
})();

// @@hasInstance works for bound functions.
(function() {
  let BC = function() {};
  const bc = new BC();
  const bound = BC.bind();
  arktest.assertEQ(bound[Symbol.hasInstance](bc), true);
  arktest.assertEQ(bound[Symbol.hasInstance]([]), false);
})();

// if OrdinaryHasInstance is passed a non-callable receiver, return false.
arktest.assertEQ(Function.prototype[Symbol.hasInstance].call(Array, []), true);
arktest.assertEQ(Function.prototype[Symbol.hasInstance].call({}, {}), false);

// OrdinaryHasInstance passed a non-object argument returns false.
arktest.assertEQ(Function.prototype[Symbol.hasInstance].call(Array, 0), false);

// Cannot assign to @@hasInstance with ArkTools.functionPrototype%.
(function() {
  'use strict';
  function f() {}
  arktest.expectThrow(function() { f[Symbol.hasInstance] = (v) => v }, ((e: Error): boolean => e instanceof TypeError));
})();

// Check correct invocation of @@hasInstance handler on function instance.
(function() {
  function f() {}
  let counter = 0;
  const proto = Object.getPrototypeOf(f);
  Object.setPrototypeOf(f, null);
  f[Symbol.hasInstance] = function(v) { ++counter; return true };
  Object.setPrototypeOf(f, proto);
  arktest.assertTrue(1 instanceof f);
  arktest.assertEQ(1, counter);
})();
