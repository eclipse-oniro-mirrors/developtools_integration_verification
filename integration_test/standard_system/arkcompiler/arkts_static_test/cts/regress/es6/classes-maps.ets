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

'use strict';

(function TestMaps() {
  class Base {}
  class Derived extends Base {}

  let d1 = new Derived();
  let d2 = new Derived();

  arktest.assertTrue(ArkTools.haveSameMap(d1, d2));
}());


(function TestProtoModificationArray() {
  let called = 0;
  function f() {
    called++;
    arktest.assertFalse(Array.isArray(this));
  }
  class Derived extends Array {}
  arktest.assertTrue(Object.is(Derived.__proto__, Array));

  let d1 = new Derived();
  arktest.assertTrue(Array.isArray(d1));

  Derived.__proto__ = f;
  called = 0;
  let d2 = new Derived();
  arktest.assertTrue(Object.is(1, called));
  arktest.assertFalse(Array.isArray(d2));

  arktest.assertFalse(ArkTools.haveSameMap(d1, d2));
}());


(function TestProtoModification() {
  let called = 0;
  function f() {
    called++;
    let exn = null;
    try {
      this.byteLength;
    } catch (e) {
      exn = e;
    }
    arktest.assertTrue(exn instanceof TypeError);
  }
  class Derived extends Uint8Array {
    constructor() { super(10); }
  }
  arktest.assertTrue(Object.is(Derived.__proto__, Uint8Array));

  let d1 = new Derived();
  arktest.assertTrue(Object.is(10, d1.byteLength));

  Derived.__proto__ = f;
  called = 0;
  let d2 = new Derived();
  arktest.assertTrue(Object.is(1, called));
  arktest.expectThrow(() => { d2.byteLength; }, (e) => e instanceof TypeError);

  arktest.assertFalse(ArkTools.haveSameMap(d1, d2));
}());
