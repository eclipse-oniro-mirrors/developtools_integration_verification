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


// Do not read out the prototype from a cross-realm object.

/*---
tags: [compile-only, negative]
expected_out_1: "Semantic error ESE0143: Unresolved reference Realm"
---*/

const realm = Realm.create();

__proto__ = {};
arktest.assertEQ(null,
  Realm.eval(realm, '3; Reflect.getPrototypeOf(Realm.global(0))'));
arktest.assertFalse(Realm.eval(realm, '3; Realm.global(0) instanceof Object'));

__proto__ = new Proxy({}, { getPrototypeOf() { arktest.assertTrue(false) } });
arktest.assertEQ(null,
    Realm.eval(realm, '1; Reflect.getPrototypeOf(Realm.global(0))'));
arktest.assertFalse(Realm.eval(realm, '1; Realm.global(0) instanceof Object'));

// Test that the instannceof check works in optimized code.
const test = Realm.eval(realm,
    '()=>{1.1; return Realm.global(0) instanceof Object; }');
ArkTools.prepareFunctionForOptimization(test);
arktest.assertFalse(test());
test();
test();
ArkTools.optimizeFunctionOnNextCall(test);
arktest.assertFalse(test());

__proto__ = {};
__proto__ = new Proxy({}, { get(t, p, r) { arktest.assertTrue(false) } });
arktest.assertEQ(null,
    Realm.eval(realm, '2; Reflect.getPrototypeOf(Realm.global(0))'));
arktest.assertFalse(Realm.eval(realm, '2; Realm.global(0) instanceof Object'));


__proto__ = {};
__proto__.__proto__ = new Proxy({}, {
  getPrototypeOf() { arktest.assertTrue(false) }
});
arktest.assertEQ(null,
  Realm.eval(realm, '4; Reflect.getPrototypeOf(Realm.global(0))'));
arktest.assertFalse(Realm.eval(realm, '4; Realm.global(0) instanceof Object'));

// 2-level proxy indirection
__proto__ = {};
__proto__ = new Proxy({},
  new Proxy({}, {
    get() { arktest.assertTrue(false) }
  })
);
arktest.assertEQ(null,
  Realm.eval(realm, '5; Reflect.getPrototypeOf(Realm.global(0))'));
arktest.assertFalse(Realm.eval(realm, '5; Realm.global(0) instanceof Object'));
