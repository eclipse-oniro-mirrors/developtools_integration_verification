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
  let handler = {};
  let p = new Proxy({}, handler);
  handler.__proto__ = p;
  try { return p.__proto__; } catch(e) { arktest.assertTrue(e instanceof RangeError); }
})();

(function TestSetPrototype() {
  let handler = {};
  let p = new Proxy({}, handler);
  handler.__proto__ = p;
  try { p.__proto__ = p; } catch(e) { arktest.assertTrue(e instanceof RangeError); }
})();

(function TestHasProperty() {
  let handler = {};
  let p = new Proxy({}, handler);
  handler.__proto__ = p;
  try {
    return Reflect.has(p, 'foo');
  } catch(e) { arktest.assertTrue(e instanceof RangeError); }
})();

(function TestSet() {
  let handler = {};
  let p = new Proxy({}, handler);
  handler.__proto__ = p;
  try { p.foo = 1; } catch(e) { arktest.assertTrue(e instanceof RangeError); }
})();

(function TestGet() {
  let handler = {};
  let p = new Proxy({}, handler);
  handler.__proto__ = p;
  try { return p.foo; } catch(e) { arktest.assertTrue(e instanceof RangeError); }
})();

(function TestEnumerate() {
  let handler = {};
  let p = new Proxy({}, handler);
  handler.__proto__ = p;
  try { for (let x in p) {} } catch(e) { arktest.assertTrue(e instanceof RangeError); }
})();

(function TestIsExtensible() {
  let handler = {};
  let p = new Proxy({}, handler);
  handler.__proto__ = p;
  try {
    return Reflect.isExtensible(p);
  } catch(e) { arktest.assertTrue(e instanceof RangeError); }
})();

(function TestPreventExtensions() {
  let handler = {};
  let p = new Proxy({}, handler);
  handler.__proto__ = p;
  try {
    Reflect.preventExtensions(p);
  } catch(e) { arktest.assertTrue(e instanceof RangeError); }
})();

(function TestGetOwnPropertyDescriptor() {
  let handler = {};
  let p = new Proxy({}, handler);
  handler.__proto__ = p;
  try {
    return Object.getOwnPropertyDescriptor(p, 'foo');
  } catch(e) { arktest.assertTrue(e instanceof RangeError); }
})();

(function TestDeleteProperty() {
  let handler = {};
  let p = new Proxy({}, handler);
  handler.__proto__ = p;
  try { delete p.foo; } catch(e) { arktest.assertTrue(e instanceof RangeError); }
})();

(function TestDefineProperty() {
  let handler = {};
  let p = new Proxy({}, handler);
  handler.__proto__ = p;
  try {
    Object.defineProperty(p, 'foo', {value: 'bar'});
  } catch(e) { arktest.assertTrue(e instanceof RangeError); }
})();

(function TestOwnKeys() {
  let handler = {};
  let p = new Proxy({}, handler);
  handler.__proto__ = p;
  try {
    return Reflect.ownKeys(p);
  } catch(e) { arktest.assertTrue(e instanceof RangeError); }
})();

(function TestCall() {
  let handler = {};
  let p = new Proxy(function() {}, handler);
  handler.__proto__ = p;
  try { return p(); } catch(e) { arktest.assertTrue(e instanceof RangeError); }
})();

(function TestConstruct() {
  let handler = {};
  let p = new Proxy(function() { this.foo = 1; }, handler);
  handler.__proto__ = p;
  try { return new p(); } catch(e) { arktest.assertTrue(e instanceof RangeError); }
})();
