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

// Test that traps that involve walking the target object's prototype chain
// don't overflow the stack when the original proxy is on that chain.

/*---
tags: [compile-only, negative]
expected_out_1: "Syntax error ESY0320: Function expressions are not supported, use arrow functions instead"
---*/

(function TestGetPrototype() {
  let p = new Proxy({}, {});
  p.__proto__ = p;
  try { return p.__proto__; } catch(e) { arktest.assertTrue(e instanceof RangeError); }
})();

(function TestSetPrototype() {
  let p = new Proxy({}, {});
  p.__proto__ = p;
  try { p.__proto__ = p; } catch(e) { arktest.assertTrue(e instanceof RangeError); }
})();

(function TestHasProperty() {
  let p = new Proxy({}, {});
  p.__proto__ = p;
  try {
    return Reflect.has(p, 'foo');
  } catch(e) { arktest.assertTrue(e instanceof RangeError); }
})();

(function TestSet() {
  let p = new Proxy({}, {});
  p.__proto__ = p;
  try { p.foo = 1; } catch(e) { arktest.assertTrue(e instanceof RangeError); }
})();

(function TestGet() {
  let p = new Proxy({}, {});
  p.__proto__ = p;
  try { return p.foo; } catch(e) { arktest.assertTrue(e instanceof RangeError); }
})();

(function TestEnumerate() {
  let p = new Proxy({}, {});
  p.__proto__ = p;
  try { for (let x in p) {} } catch(e) { arktest.assertTrue(e instanceof RangeError); }
})();

// The following traps don't involve the target object's prototype chain;
// we test them anyway for completeness.

(function TestIsExtensible() {
  let p = new Proxy({}, {});
  p.__proto__ = p;
  return Reflect.isExtensible(p);
})();

(function TestPreventExtensions() {
  let p = new Proxy({}, {});
  p.__proto__ = p;
  Reflect.preventExtensions(p);
})();

(function TestGetOwnPropertyDescriptor() {
  let p = new Proxy({}, {});
  p.__proto__ = p;
  return Object.getOwnPropertyDescriptor(p, 'foo');
})();

(function TestDeleteProperty() {
  let p = new Proxy({}, {});
  p.__proto__ = p;
  delete p.foo;
})();

(function TestDefineProperty() {
  let p = new Proxy({}, {});
  p.__proto__ = p;
  Object.defineProperty(p, 'foo', {value: 'bar'});
})();

(function TestOwnKeys() {
  let p = new Proxy({}, {});
  p.__proto__ = p;
  return Reflect.ownKeys(p);
})();

(function TestCall() {
  let p = new Proxy(function() {}, {});
  p.__proto__ = p;
  return p();
})();

(function TestConstruct() {
  let p = new Proxy(function() { this.foo = 1; }, {});
  p.__proto__ = p;
  return new p();
})();
