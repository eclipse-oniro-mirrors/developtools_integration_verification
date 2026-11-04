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

let key = Symbol('method-key');


function iD(x) {
  return x;
}


(function TestMethodComputedNameString() {
  let object = {
    a() { return 'A'},
    ['b']() { return 'B'; },
    c() { return 'C'; },
    [iD('d')]() { return 'D'; },
  };
  arktest.assertEQ('A', object.a());
  arktest.assertEQ('B', object.b());
  arktest.assertEQ('C', object.c());
  arktest.assertEQ('D', object.d());
  arktest.assertEQ(['a', 'b', 'c', 'd'], Object.keys(object));
})();


(function TestMethodComputedNameNumber() {
  let object = {
    a() { return 'A'; },
    [1]() { return 'B'; },
    c() { return 'C'; },
    [iD(2)]() { return 'D'; },
  };
  arktest.assertEQ('A', object.a());
  arktest.assertEQ('B', object[1]());
  arktest.assertEQ('C', object.c());
  arktest.assertEQ('D', object[2]());
  // Array indexes first.
  arktest.assertEQ(['1', '2', 'a', 'c'], Object.keys(object));
})();


(function TestMethodComputedNameSymbol() {
  const sym1 = Symbol();
  const sym2 = Symbol();
  let object = {
    a() { return 'A'; },
    [sym1]() { return 'B'; },
    c() { return 'C'; },
    [iD(sym2)]() { return 'D'; },
  };
  arktest.assertEQ('A', object.a());
  arktest.assertEQ('B', object[sym1]());
  arktest.assertEQ('C', object.c());
  arktest.assertEQ('D', object[sym2]());
  arktest.assertEQ(['a', 'c'], Object.keys(object));
  arktest.assertEQ([sym1, sym2], Object.getOwnPropertySymbols(object));
})();


function assertIteratorResult(value, done, result) {
  arktest.assertEQ({ value: value, done: done}, result);
}


(function TestGeneratorComputedName() {
  let object = {
    *['a']() {
      yield 1;
      yield 2;
    },
    async ['b']() {
      return 42;
    },
    async *['c']() {
      yield 1;
      yield 2;
    }
  };
  arktest.assertEQ('a', object.a.name);
  arktest.assertEQ('b', object.b.name);
  arktest.assertEQ('c', object.c.name);

  const iter = object.a();
  assertIteratorResult(1, false, iter.next());
  assertIteratorResult(2, false, iter.next());
  assertIteratorResult(undefined, true, iter.next());

  arktest.assertEQ(['a', 'b', 'c'], Object.keys(object));
})();


(function TestToNameSideEffects() {
  let counter = 0;
  const key1 = {
    toString: function() {
      arktest.assertEQ(0, counter++);
      return 'b';
    }
  };
  const key2 = {
    toString: function() {
      arktest.assertEQ(1, counter++);
      return 'd';
    }
  };
  let object = {
    a() { return 'A'; },
    [key1]() { return 'B'; },
    c() { return 'C'; },
    [key2]() { return 'D'; },
  };
  arktest.assertEQ(2, counter);
  arktest.assertEQ('A', object.a());
  arktest.assertEQ('B', object.b());
  arktest.assertEQ('C', object.c());
  arktest.assertEQ('D', object.d());
  arktest.assertEQ(['a', 'b', 'c', 'd'], Object.keys(object));
})();


(function TestDuplicateKeys() {
  'use strict';
  // ES5 does not allow duplicate keys.
  // ES6 does but we haven't changed our code yet.

  let object = {
    a() { return 1; },
    ['a']() { return 2; },
  };
  arktest.assertEQ(2, object.a());
})();
