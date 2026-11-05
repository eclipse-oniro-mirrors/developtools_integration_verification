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

let get = () => {};
let set = () => {};
let target = {};
let handler = {
  getOwnPropertyDescriptor(target, prop) {
    let configurable = true;
    if (prop == 'both') {
      return { get, set, configurable };
    } else if (prop == 'get') {
      return { get, configurable };
    } else if (prop == 'set') {
      return { set, configurable };
    } else if (prop == 'data') {
      return { value: 42, configurable };
    } else {
      return Reflect.getOwnPropertyDescriptor(target, prop);
    }
  }
};

// Test behavior on own properties.
let proxy = new Proxy(target, handler);
arktest.assertEQ(get, proxy.__lookupGetter__('both'));
arktest.assertEQ(get, proxy.__lookupGetter__('get'));
arktest.assertEQ(undefined, proxy.__lookupGetter__('set'));
arktest.assertEQ(undefined, proxy.__lookupGetter__('data'));
arktest.assertEQ(set, proxy.__lookupSetter__('both'));
arktest.assertEQ(undefined, proxy.__lookupSetter__('get'));
arktest.assertEQ(set, proxy.__lookupSetter__('set'));
arktest.assertEQ(undefined, proxy.__lookupSetter__('data'));

// Test behavior on the prototype chain.
let object = { __proto__: proxy };
arktest.assertEQ(get, object.__lookupGetter__('both'));
arktest.assertEQ(get, object.__lookupGetter__('get'));
arktest.assertEQ(undefined, object.__lookupGetter__('set'));
arktest.assertEQ(undefined, object.__lookupGetter__('data'));
arktest.assertEQ(set, object.__lookupSetter__('both'));
arktest.assertEQ(undefined, object.__lookupSetter__('get'));
arktest.assertEQ(set, object.__lookupSetter__('set'));
arktest.assertEQ(undefined, object.__lookupSetter__('data'));

// Test being shadowed while on prototype chain.
let shadower = { __proto__: proxy, both: 1, get: 2, set: 3, data: 4 };
arktest.assertEQ(undefined, shadower.__lookupGetter__('both'));
arktest.assertEQ(undefined, shadower.__lookupGetter__('get'));
arktest.assertEQ(undefined, shadower.__lookupGetter__('set'));
arktest.assertEQ(undefined, shadower.__lookupGetter__('data'));
arktest.assertEQ(undefined, shadower.__lookupSetter__('both'));
arktest.assertEQ(undefined, shadower.__lookupSetter__('get'));
arktest.assertEQ(undefined, shadower.__lookupSetter__('set'));
arktest.assertEQ(undefined, shadower.__lookupSetter__('data'));

// Test getPrototypeOf trap.
let getFoo = () => {};
let setFoo = () => {};
let proto = {};
Reflect.defineProperty(proto, 'foo', { get: getFoo, set: setFoo });
Reflect.setPrototypeOf(target, proto);
arktest.assertEQ(getFoo, proxy.__lookupGetter__('foo'));
arktest.assertEQ(setFoo, proxy.__lookupSetter__('foo'));
handler.getPrototypeOf = () => null;
arktest.assertEQ(undefined, proxy.__lookupGetter__('foo'));
arktest.assertEQ(undefined, proxy.__lookupSetter__('foo'));
handler.getPrototypeOf = () => proto;
arktest.assertEQ(getFoo, proxy.__lookupGetter__('foo'));
arktest.assertEQ(setFoo, proxy.__lookupSetter__('foo'));

// Test shadowing the prototype.
Reflect.defineProperty(proto, 'data', { get: getFoo, set: setFoo });
arktest.assertEQ(undefined, proxy.__lookupGetter__('data'));
arktest.assertEQ(undefined, proxy.__lookupSetter__('data'));
