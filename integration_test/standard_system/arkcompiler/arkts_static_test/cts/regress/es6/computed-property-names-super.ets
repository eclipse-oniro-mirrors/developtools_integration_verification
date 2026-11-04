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
expected_out_1: "Semantic error ESE0143: Unresolved reference Symbol"
---*/

let key = Symbol('super-key');




function iD(x) {
  return x;
}


(function TestComputedMethodSuper() {
  let proto = {
    m() {
      return ' proto m';
    }
  };
  let object = {
    __proto__: proto,
    ['a']() { return 'a' + super.m(); },
    [iD('b')]() { return 'b' + super.m(); },
    [0]() { return '0' + super.m(); },
    [iD(1)]() { return '1' + super.m(); },
  };

  arktest.assertEQ('a proto m', object.a());
  arktest.assertEQ('b proto m', object.b());
  arktest.assertEQ('0 proto m', object[0]());
  arktest.assertEQ('1 proto m', object[1]());
})();


(function TestComputedGetterSuper() {
  let proto = {
    m() {
      return ' proto m';
    }
  };
  let object = {
    __proto__: proto,
    get ['a']() { return 'a' + super.m(); },
    get [iD('b')]() { return 'b' + super.m(); },
    get [0]() { return '0' + super.m(); },
    get [iD(1)]() { return '1' + super.m(); },
  };
  arktest.assertEQ('a proto m', object.a);
  arktest.assertEQ('b proto m', object.b);
  arktest.assertEQ('0 proto m', object[0]);
  arktest.assertEQ('1 proto m', object[1]);
})();


(function TestComputedSetterSuper() {
  let value;
  let proto = {
    m(name, v) {
      value = name + ' ' + v;
    }
  };
  let object = {
    __proto__: proto,
    set ['a'](v) { super.m('a', v); },
    set [iD('b')](v) { super.m('b', v); },
    set [0](v) { super.m('0', v); },
    set [iD(1)](v) { super.m('1', v); },
  };
  object.a = 2;
  arktest.assertEQ('a 2', value);
  object.b = 3;
  arktest.assertEQ('b 3', value);
  object[0] = 4;
  arktest.assertEQ('0 4', value);
  object[1] = 5;
  arktest.assertEQ('1 5', value);
})();
