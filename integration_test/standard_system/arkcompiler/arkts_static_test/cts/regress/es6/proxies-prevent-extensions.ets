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

// Reflect.

/*---
tags: [compile-only, negative]
expected_out_1: "Syntax error ESY0320: Function expressions are not supported, use arrow functions instead"
---*/

(function () {
  // No trap.

  let target = {};
  let handler = {};
  let proxy = new Proxy(target, handler);

  arktest.assertTrue(Reflect.isExtensible(target));
  arktest.assertTrue(Reflect.isExtensible(proxy));
  arktest.assertTrue(Reflect.preventExtensions(proxy));
  arktest.assertFalse(Reflect.isExtensible(target));
  arktest.assertFalse(Reflect.isExtensible(proxy));
})();

(function () {
  // "Undefined" trap.

  let target = {};
  let handler = { preventExtensions: null };
  let proxy = new Proxy(target, handler);

  arktest.assertTrue(Reflect.isExtensible(target));
  arktest.assertTrue(Reflect.isExtensible(proxy));
  arktest.assertTrue(Reflect.preventExtensions(proxy));
  arktest.assertFalse(Reflect.isExtensible(target));
  arktest.assertFalse(Reflect.isExtensible(proxy));
})();


(function () {
  // Invalid trap.

  let target = {};
  let handler = { preventExtensions: 42 };
  let proxy = new Proxy(target, handler);

  arktest.expectThrow(() => { Reflect.preventExtensions(proxy) }, ((e: Error): boolean => e instanceof TypeError));
})();


(function () {
  let target = {};
  let handler = { isExtensible() { return 'bla' } };
  let proxy = new Proxy(target, handler);

  // Trap returns trueish and target is extensible.
  arktest.assertTrue(Reflect.isExtensible(proxy));

  // Trap returns trueish but target is not extensible.
  Reflect.preventExtensions(target);
  arktest.expectThrow(() => { Reflect.isExtensible(proxy) }, ((e: Error): boolean => e instanceof TypeError));
})();


(function () {
  // Trap returns falsish.

  let target = {};
  let handler = { preventExtensions() { return 0 } };
  let proxy = new Proxy(target, handler);

  arktest.assertFalse(Reflect.preventExtensions(proxy));
  Reflect.preventExtensions(target);
  arktest.assertFalse(Reflect.preventExtensions(proxy));
})();


(function () {
  let target = {};
  let handler = { preventExtensions() { return Symbol() } };
  let proxy = new Proxy(target, handler);

  // Trap returns trueish but target is extensible.
  arktest.expectThrow(() => { Reflect.preventExtensions(proxy) }, ((e: Error): boolean => e instanceof TypeError));

  // Trap returns trueish and target is not extensible.
  Reflect.preventExtensions(target);
  arktest.assertTrue(Reflect.preventExtensions(proxy));
})();


(function () {
  // Target is proxy
  let object = {};
  arktest.assertTrue(Reflect.preventExtensions(object));
  let target = new Proxy(object, {});
  let proxy = new Proxy(target, {});
  arktest.assertFalse(Reflect.isExtensible(object));
  arktest.assertFalse(Reflect.isExtensible(target));
  arktest.assertFalse(Reflect.isExtensible(proxy));
})();

// Object.
(function () {
  // No trap.

  let target = {};
  let handler = {};
  let proxy = new Proxy(target, handler);

  arktest.assertTrue(Object.isExtensible(target));
  arktest.assertTrue(Object.isExtensible(proxy));
  arktest.assertEQ(proxy, Object.preventExtensions(proxy));
  arktest.assertFalse(Object.isExtensible(target));
  arktest.assertFalse(Object.isExtensible(proxy));
})();

(function () {
  // "Undefined" trap.

  let target = {};
  let handler = { preventExtensions: null };
  let proxy = new Proxy(target, handler);

  arktest.assertTrue(Object.isExtensible(target));
  arktest.assertTrue(Object.isExtensible(proxy));
  arktest.assertEQ(proxy, Object.preventExtensions(proxy));
  arktest.assertFalse(Object.isExtensible(target));
  arktest.assertFalse(Object.isExtensible(proxy));
})();


(function () {
  // Invalid trap.

  let target = {};
  let handler = { preventExtensions: 42 };
  let proxy = new Proxy(target, handler);

  arktest.expectThrow(() => { Object.preventExtensions(proxy) }, ((e: Error): boolean => e instanceof TypeError));
})();


(function () {
  let target = {};
  let handler = { isExtensible() { return 'bla' } };
  let proxy = new Proxy(target, handler);

  // Trap returns trueish and target is extensible.
  arktest.assertTrue(Object.isExtensible(proxy));

  // Trap returns trueish but target is not extensible.
  arktest.assertEQ(target, Object.preventExtensions(target));
  arktest.expectThrow(() => { Object.isExtensible(proxy) }, ((e: Error): boolean => e instanceof TypeError));
})();


(function () {
  // Trap returns falsish.

  let target = {};
  let handler = { isExtensible() { return false } };
  let proxy = new Proxy(target, handler);

  arktest.expectThrow(() => { Object.isExtensible(proxy) }, ((e: Error): boolean => e instanceof TypeError));
  arktest.assertEQ(target, Object.preventExtensions(target));
  arktest.assertFalse(Object.isExtensible(proxy));
})();


(function () {
  // Trap returns falsish.

  let target = {};
  let handler = { preventExtensions() { return 0 } };
  let proxy = new Proxy(target, handler);

  arktest.assertFalse(Reflect.preventExtensions(proxy));
  arktest.assertEQ(target, Object.preventExtensions(target));
  arktest.assertFalse(Reflect.preventExtensions(proxy));
  arktest.expectThrow(() => { Object.preventExtensions(proxy) }, ((e: Error): boolean => e instanceof TypeError));
})();


(function () {
  let target = {};
  let handler = { preventExtensions() { return Symbol() } };
  let proxy = new Proxy(target, handler);

  // Trap returns trueish but target is extensible.
  arktest.expectThrow(() => { Object.preventExtensions(proxy) }, ((e: Error): boolean => e instanceof TypeError));

  // Trap returns trueish and target is not extensible.
  arktest.assertEQ(target, Object.preventExtensions(target));
  arktest.assertTrue(Reflect.preventExtensions(proxy));
})();


(function () {
  // Target is proxy
  let object = {};
  arktest.assertEQ(object, Object.preventExtensions(object));
  let target = new Proxy(object, {});
  let proxy = new Proxy(target, {});
  arktest.assertFalse(Object.isExtensible(object));
  arktest.assertFalse(Object.isExtensible(target));
  arktest.assertFalse(Object.isExtensible(proxy));
})();
