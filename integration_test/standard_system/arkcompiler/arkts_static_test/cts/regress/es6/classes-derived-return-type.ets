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
expected_out_1: "Semantic error ESE0033: Return statement with expression isn't allowed in constructor."
---*/

class Base {}

class DerivedWithReturn extends Base {
  constructor(x: Object) {
    super();
    return x;
  }
}

arktest.expectThrow(() => {
  new DerivedWithReturn(null);
}, (e) => e instanceof TypeError);
arktest.expectThrow(() => {
  new DerivedWithReturn(42);
}, (e) => e instanceof TypeError);
arktest.expectThrow(() => {
  new DerivedWithReturn(true);
}, (e) => e instanceof TypeError);
arktest.expectThrow(() => {
  new DerivedWithReturn('hi');
}, (e) => e instanceof TypeError);
arktest.expectThrow(() => {
  new DerivedWithReturn(Symbol());
}, (e) => e instanceof TypeError);


arktest.assertTrue(new DerivedWithReturn(undefined) instanceof DerivedWithReturn);
function F() {}
arktest.assertTrue(new DerivedWithReturn(new F()) instanceof F);
arktest.assertTrue(new DerivedWithReturn(/re/) instanceof RegExp);


class DerivedWithReturnNoSuper extends Base {
  constructor(x) {
    return x;
  }
}


arktest.expectThrow(() => {
  new DerivedWithReturnNoSuper(null);
}, (e) => e instanceof TypeError);
arktest.expectThrow(() => {
  new DerivedWithReturnNoSuper(42);
}, (e) => e instanceof TypeError);
arktest.expectThrow(() => {
  new DerivedWithReturnNoSuper(true);
}, (e) => e instanceof TypeError);
arktest.expectThrow(() => {
  new DerivedWithReturnNoSuper('hi');
}, (e) => e instanceof TypeError);
arktest.expectThrow(() => {
  new DerivedWithReturnNoSuper(Symbol());
}, (e) => e instanceof TypeError);
arktest.expectThrow(() => {
  new DerivedWithReturnNoSuper(undefined);
}, (e) => e instanceof ReferenceError);


function F2() {}
arktest.assertTrue(new DerivedWithReturnNoSuper(new F2()) instanceof F2);
arktest.assertTrue(new DerivedWithReturnNoSuper(/re/) instanceof RegExp);


class DerivedReturn extends Base {
  constructor() {
    super();
    return;
  }
}

arktest.assertTrue(new DerivedReturn() instanceof DerivedReturn);



class DerivedReturnThis extends Base {
  constructor() {
    super();
    return this;
  }
}

arktest.assertTrue(new DerivedReturnThis() instanceof DerivedReturnThis);
