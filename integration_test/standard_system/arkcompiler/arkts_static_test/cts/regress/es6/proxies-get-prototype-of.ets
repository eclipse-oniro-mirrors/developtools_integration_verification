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
expected_out_1: >-
  Semantic error ESE0174: Cannot infer type for target because class composite
  needs an explicit target type
---*/

const target = { target: 1 };
target.__proto__ = {};
let handler = { handler: 1 };
const proxy = new Proxy(target, handler);

arktest.assertEQ(Object.getPrototypeOf(proxy), target.__proto__ );

target.__proto__ = [];
arktest.assertEQ(Object.getPrototypeOf(proxy), target.__proto__);

handler.getPrototypeOf = function() {
  return 1;
}
arktest.expectThrow(function() { Object.getPrototypeOf(proxy) }, ((e: Error): boolean => e instanceof TypeError));

const targetPrototype = {a:1, b:2};
handler.getPrototypeOf = function() {
  return targetPrototype ;
}
arktest.assertEQ(Object.getPrototypeOf(proxy), targetPrototype);

// Test with proxy target:
const proxy2 = new Proxy(proxy, {'handler':1});
arktest.assertEQ(Object.getPrototypeOf(proxy2), targetPrototype);

// Test with Proxy handler:
const proxy3Prototype = {'proto3':true};
const handlerProxy = new Proxy({
  getPrototypeOf: function() { return proxy3Prototype }
}, {});
const proxy3 = new Proxy(target, handlerProxy);
arktest.assertEQ(Object.getPrototypeOf(proxy3), proxy3Prototype);


// Some tests with Object.prototype.isPrototypeOf

(function () {
  let object = {};
  let handler = {};
  let proto = new Proxy({}, handler);
  object.__proto__ = proto;

  arktest.assertTrue(proto.isPrototypeOf(object));
  arktest.assertTrue(Object.prototype.isPrototypeOf.call(proto, object));

  handler.getPrototypeOf = function () { return Object.prototype };
  arktest.assertTrue(proto.isPrototypeOf(object));
  arktest.assertTrue(Object.prototype.isPrototypeOf.call(proto, object));
  arktest.assertTrue(Object.prototype.isPrototypeOf(object));
  arktest.assertFalse(Object.prototype.isPrototypeOf.call(Array.prototype, object));
  arktest.assertFalse(Array.prototype.isPrototypeOf(object));

  handler.getPrototypeOf = function () { return object };
  arktest.assertTrue(Object.prototype.isPrototypeOf.call(proto, object));
  arktest.assertTrue(proto.isPrototypeOf(object));
  arktest.assertTrue(Object.prototype.isPrototypeOf.call(object, object));
  arktest.assertTrue(object.isPrototypeOf(object));

  handler.getPrototypeOf = function () { throw 'foo' };
  arktest.assertTrue(proto.isPrototypeOf(object));
  arktest.assertTrue(Object.prototype.isPrototypeOf.call(proto, object));
  arktest.expectThrow(()=> Object.prototype.isPrototypeOf(object));
  arktest.expectThrow(()=> Object.prototype.isPrototypeOf.call(Array.prototype, object));
  arktest.expectThrow(()=> Array.prototype.isPrototypeOf(object));
})();

(function () {
  let handler = {};
  let object = new Proxy({}, handler);
  let proto = {};

  arktest.assertFalse(Object.prototype.isPrototypeOf.call(object, object));
  arktest.assertFalse(Object.prototype.isPrototypeOf.call(proto, object));
  arktest.assertTrue(Object.prototype.isPrototypeOf.call(Object.prototype, object));

  handler.getPrototypeOf = function () { return proto };
  arktest.assertTrue(Object.prototype.isPrototypeOf.call(proto, object));
  arktest.assertFalse(Object.prototype.isPrototypeOf.call({}, object));
  arktest.assertTrue(Object.prototype.isPrototypeOf.call(Object.prototype, object));

  handler.getPrototypeOf = function () { return object };
  arktest.assertTrue(Object.prototype.isPrototypeOf.call(object, object));

  handler.getPrototypeOf = function () { throw 'foo' };
  arktest.expectThrow(()=> Object.prototype.isPrototypeOf.call(object, object));
  arktest.expectThrow(()=> Object.prototype.isPrototypeOf(object));
})();
