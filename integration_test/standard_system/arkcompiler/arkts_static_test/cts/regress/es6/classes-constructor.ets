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

(function TestDefaultConstructorNoCrash() {
  // Regression test for https://upstream issue tracker/issues/detail?id=3661
  class C {}
  arktest.expectThrow(() => {C();}, (e) => e instanceof TypeError);
  arktest.expectThrow(() => {C(1);}, (e) => e instanceof TypeError);
  arktest.assertTrue(new C() instanceof C);
  arktest.assertTrue(new C(1) instanceof C);
})();


(function TestConstructorCall(){
  let realmIndex = Realm.create();
  let otherTypeError = Realm.eval(realmIndex, 'TypeError');
  let A = Realm.eval(realmIndex, '"use strict"; class A {}; A');
  let instance = new A();
  let constructor = instance.constructor;
  let otherTypeError = Realm.eval(realmIndex, 'TypeError');
  if (otherTypeError === TypeError) {
    throw Error('Should not happen!');
  }

  // https://tc39.es/ecma262/#sec-ecmascript-function-objects-call-thisargument-argumentslist
  // 10.2.1 [[Call]] throws a TypeError created in callee context with F's
  // associated Realm Record when the called function is a classConstructor
  arktest.expectThrow(() => { Realm.eval(realmIndex, 'A()') }, (e) => e instanceof otherTypeError);
  arktest.expectThrow(() => { instance.constructor() }, (e) => e instanceof otherTypeError);
  arktest.expectThrow(() => { A() }, (e) => e instanceof otherTypeError);

  // ES6 9.3.1 call() first activates the callee context before invoking the
  // method. The TypeError from the constructor is thus thrown in the other
  // Realm.
  arktest.expectThrow(() => { Realm.eval(realmIndex, 'A.call()') }, (e) => e instanceof otherTypeError);
  arktest.expectThrow(() => { constructor.call() }, (e) => e instanceof otherTypeError);
  arktest.expectThrow(() => { A.call() }, (e) => e instanceof otherTypeError);
})();


(function TestConstructorCallOptimized() {
  class A { };

  function invokeConstructor() { A() }
  function callConstructor() { A.call() }
  function applyConstructor() { A.apply() }
  ArkTools.prepareFunctionForOptimization(invokeConstructor);
  ArkTools.prepareFunctionForOptimization(callConstructor);
  ArkTools.prepareFunctionForOptimization(applyConstructor);

  for (let i=0; i<3; i++) {
    arktest.expectThrow(invokeConstructor);
    arktest.expectThrow(callConstructor);
    arktest.expectThrow(applyConstructor);
  }
  // Make sure we still check for class constructors when calling optimized
  // code.
  ArkTools.optimizeFunctionOnNextCall(invokeConstructor);
  arktest.expectThrow(invokeConstructor);
  ArkTools.optimizeFunctionOnNextCall(callConstructor);
  arktest.expectThrow(callConstructor);
  ArkTools.optimizeFunctionOnNextCall(applyConstructor);
  arktest.expectThrow(applyConstructor);
})();


(function TestDefaultConstructor() {
  let calls = 0;
  class Base {
    constructor() {
      calls++;
    }
  }
  class Derived extends Base {}
  let object = new Derived;
  arktest.assertEQ(1, calls);

  calls = 0;
  arktest.expectThrow(() => { Derived(); }, (e) => e instanceof TypeError);
  arktest.assertEQ(0, calls);
})();


(function TestDefaultConstructorArguments() {
  let args;
  let self;
  class Base {
    constructor() {
      self = this;
      args = arguments;
    }
  }
  class Derived extends Base {}

  new Derived;
  arktest.assertEQ(0, args.length);

  new Derived(0, 1, 2);
  arktest.assertEQ(3, args.length);
  arktest.assertTrue(self instanceof Derived);

  let arr = new Array(100);
  let obj = {};
  arktest.expectThrow(() => {Derived.apply(obj, arr);}, (e) => e instanceof TypeError);
})();


(function TestDefaultConstructorArguments2() {
  let args;
  class Base {
    constructor(x, y) {
      args = arguments;
    }
  }
  class Derived extends Base {}

  new Derived;
  arktest.assertEQ(0, args.length);

  new Derived(1);
  arktest.assertEQ(1, args.length);
  arktest.assertEQ(1, args[0]);

  new Derived(1, 2, 3);
  arktest.assertEQ(3, args.length);
  arktest.assertEQ(1, args[0]);
  arktest.assertEQ(2, args[1]);
  arktest.assertEQ(3, args[2]);
})();
