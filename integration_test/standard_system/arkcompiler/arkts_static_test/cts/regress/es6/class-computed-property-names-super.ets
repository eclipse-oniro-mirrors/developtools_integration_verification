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
expected_out_1: "Semantic error ESE0087: Property 'getOwnPropertyDescriptor' does not exist on type 'Object'"
---*/

function iD(x: Object): Object {
  return x;
}

function assertMethodDescriptor(object: Object, name: string) {
  let descr = Object.getOwnPropertyDescriptor(object, name);
  arktest.assertTrue(descr.configurable);
  arktest.assertFalse(descr.enumerable);
  arktest.assertTrue(descr.writable);
  arktest.assertEQ('function', typeof descr.value);
  arktest.assertFalse('prototype' in descr.value);
  arktest.assertEQ('' + name, descr.value.name);
}


function assertGetterDescriptor(object: Object, name: string) {
  let descr = Object.getOwnPropertyDescriptor(object, name);
  arktest.assertTrue(descr.configurable);
  arktest.assertFalse(descr.enumerable);
  arktest.assertEQ('function', typeof descr.get);
  arktest.assertFalse('prototype' in descr.get);
  arktest.assertEQ(undefined, descr.set);
  arktest.assertEQ('get ' + name, descr.get.name);
}


function assertSetterDescriptor(object: Object, name: string) {
  let descr = Object.getOwnPropertyDescriptor(object, name);
  arktest.assertTrue(descr.configurable);
  arktest.assertFalse(descr.enumerable);
  arktest.assertEQ(undefined, descr.get);
  arktest.assertEQ('function', typeof descr.set);
  arktest.assertFalse('prototype' in descr.set);
  arktest.assertEQ('set ' + name, descr.set.name);
}


function assertAccessorDescriptor(object, name) {
  let descr = Object.getOwnPropertyDescriptor(object, name);
  arktest.assertTrue(descr.configurable);
  arktest.assertFalse(descr.enumerable);
  arktest.assertEQ('function', typeof descr.get);
  arktest.assertEQ('function', typeof descr.set);
  arktest.assertFalse('prototype' in descr.get);
  arktest.assertFalse('prototype' in descr.set);
  arktest.assertEQ('get ' + name, descr.get.name);
  arktest.assertEQ('set ' + name, descr.set.name);
}



(function TestComputedMethodSuper() {
  class Base {
    m() {
      return ' base m';
    }
  }
  class Derived extends Base {
    ['a']() { return 'a' + super.m(); }
    [iD('b')]() { return 'b' + super.m(); }
    [0]() { return '0' + super.m(); }
    [iD(1)]() { return '1' + super.m(); }
    [iD(2147483649)]() { return '2147483649' + super.m(); }
    [iD(4294967294)]() { return '4294967294' + super.m(); }
    [iD(4294967295)]() { return '4294967295' + super.m(); }
  }

  assertMethodDescriptor(Derived.prototype, 'a');
  assertMethodDescriptor(Derived.prototype, 'b');
  assertMethodDescriptor(Derived.prototype, 0);
  assertMethodDescriptor(Derived.prototype, 1);
  assertMethodDescriptor(Derived.prototype, 2147483649);
  assertMethodDescriptor(Derived.prototype, 4294967294);
  assertMethodDescriptor(Derived.prototype, 4294967295);

  arktest.assertEQ('a base m', new Derived().a());
  arktest.assertEQ('b base m', new Derived().b());
  arktest.assertEQ('0 base m', new Derived()[0]());
  arktest.assertEQ('1 base m', new Derived()[1]());
  arktest.assertEQ('2147483649 base m', new Derived()[2147483649]());
  arktest.assertEQ('4294967294 base m', new Derived()[4294967294]());
  arktest.assertEQ('4294967295 base m', new Derived()[4294967295]());
})();


(function TestComputedGetterSuper() {
  class Base {
    m() {
      return ' base m';
    }
  }
  class Derived extends Base {
    get ['a']() { return 'a' + super.m(); }
    get [iD('b')]() { return 'b' + super.m(); }
    get [0]() { return '0' + super.m(); }
    get [iD(1)]() { return '1' + super.m(); }
    get [iD(2147483649)]() { return '2147483649' + super.m(); }
    get [iD(4294967294)]() { return '4294967294' + super.m(); }
    get [iD(4294967295)]() { return '4294967295' + super.m(); }
  }

  assertGetterDescriptor(Derived.prototype, 'a');
  assertGetterDescriptor(Derived.prototype, 'b');
  assertGetterDescriptor(Derived.prototype, 0);
  assertGetterDescriptor(Derived.prototype, 1);
  assertGetterDescriptor(Derived.prototype, 2147483649);
  assertGetterDescriptor(Derived.prototype, 4294967294);
  assertGetterDescriptor(Derived.prototype, 4294967295);

  arktest.assertEQ('a base m', new Derived().a);
  arktest.assertEQ('b base m', new Derived().b);
  arktest.assertEQ('0 base m', new Derived()[0]);
  arktest.assertEQ('1 base m', new Derived()[1]);
  arktest.assertEQ('2147483649 base m', new Derived()[2147483649]);
  arktest.assertEQ('4294967294 base m', new Derived()[4294967294]);
  arktest.assertEQ('4294967295 base m', new Derived()[4294967295]);
})();


(function TestComputedSetterSuper() {
  let value;
  class Base {
    m(name, v) {
      value = name + ' ' + v;
    }
  }
  class Derived extends Base {
    set ['a'](v) { super.m('a', v); }
    set [iD('b')](v) { super.m('b', v); }
    set [0](v) { super.m('0', v); }
    set [iD(1)](v) { super.m('1', v); }
    set [iD(2147483649)](v) { super.m('2147483649', v); }
    set [iD(4294967294)](v) { super.m('4294967294', v); }
    set [iD(4294967295)](v) { super.m('4294967295', v); }
  }
  assertSetterDescriptor(Derived.prototype, 'a');
  assertSetterDescriptor(Derived.prototype, 'b');
  assertSetterDescriptor(Derived.prototype, 0);
  assertSetterDescriptor(Derived.prototype, 1);
  assertSetterDescriptor(Derived.prototype, 2147483649);
  assertSetterDescriptor(Derived.prototype, 4294967294);
  assertSetterDescriptor(Derived.prototype, 4294967295);

  new Derived().a = 2;
  arktest.assertEQ('a 2', value);
  new Derived().b = 3;
  arktest.assertEQ('b 3', value);
  new Derived()[0] = 4;
  arktest.assertEQ('0 4', value);
  new Derived()[1] = 5;
  arktest.assertEQ('1 5', value);
  new Derived()[2147483649] = 6;
  arktest.assertEQ('2147483649 6', value);
  new Derived()[4294967294] = 7;
  arktest.assertEQ('4294967294 7', value);
  new Derived()[4294967295] = 8;
  arktest.assertEQ('4294967295 8', value);
})();
