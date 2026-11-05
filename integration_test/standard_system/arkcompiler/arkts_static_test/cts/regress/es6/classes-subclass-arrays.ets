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

(function TestDefaultConstructor() {
  class Stack extends Array { }
  {
    let s1 = new Stack();
    arktest.assertTrue(Object.is(Stack.prototype, s1.__proto__));
    arktest.assertTrue(Array.isArray(s1));
    arktest.assertTrue(Object.is(0, s1.length));
    s1[0] = 'xyz';
    arktest.assertTrue(Object.is(1, s1.length));
    arktest.assertTrue(Object.is('xyz', s1[0]));
    s1.push(42);
    arktest.assertTrue(Object.is(2, s1.length));
    arktest.assertTrue(Object.is('xyz', s1[0]));
    arktest.assertTrue(Object.is(42, s1[1]));
  }

  {
    let s2 = new Stack(10);
    arktest.assertTrue(Object.is(Stack.prototype, s2.__proto__));
    arktest.assertTrue(Array.isArray(s2));
    arktest.assertTrue(Object.is(10, s2.length));
    arktest.assertTrue(Object.is(undefined, s2[0]));
  }

  {
    let a = [1,2,3];
    let s3 = new Stack(a);
    arktest.assertTrue(Object.is(Stack.prototype, s3.__proto__));
    arktest.assertTrue(Array.isArray(s3));
    arktest.assertTrue(Object.is(1, s3.length));
    arktest.assertTrue(Object.is(a, s3[0]));
  }

  {
    let s4 = new Stack(1, 2, 3);
    arktest.assertTrue(Object.is(Stack.prototype, s4.__proto__));
    arktest.assertTrue(Array.isArray(s4));
    arktest.assertTrue(Object.is(3, s4.length));
    arktest.assertTrue(Object.is(1, s4[0]));
    arktest.assertTrue(Object.is(2, s4[1]));
    arktest.assertTrue(Object.is(3, s4[2]));
  }

  {
    let s5 = new Stack(undefined, undefined, undefined);
    arktest.assertTrue(Object.is(Stack.prototype, s5.__proto__));
    arktest.assertTrue(Array.isArray(s5));
    arktest.assertTrue(Object.is(3, s5.length));
    arktest.assertTrue(Object.is(undefined, s5[0]));
    arktest.assertTrue(Object.is(undefined, s5[1]));
    arktest.assertTrue(Object.is(undefined, s5[2]));
  }
}());


(function TestEmptyArgsSuper() {
  class Stack extends Array {
    constructor() { super(); }
  }
  let s1 = new Stack();
  arktest.assertTrue(Object.is(Stack.prototype, s1.__proto__));
  arktest.assertTrue(Array.isArray(s1));
  arktest.assertTrue(Object.is(0, s1.length));
  s1[0] = 'xyz';
  arktest.assertTrue(Object.is(1, s1.length));
  arktest.assertTrue(Object.is('xyz', s1[0]));
  s1.push(42);
  arktest.assertTrue(Object.is(2, s1.length));
  arktest.assertTrue(Object.is('xyz', s1[0]));
  arktest.assertTrue(Object.is(42, s1[1]));
}());


(function TestOneArgSuper() {
  class Stack extends Array {
    constructor(x) {
      super(x);
    }
  }

  {
    let s2 = new Stack(10, 'ignored arg');
    arktest.assertTrue(Object.is(Stack.prototype, s2.__proto__));
    arktest.assertTrue(Array.isArray(s2));
    arktest.assertTrue(Object.is(10, s2.length));
    arktest.assertTrue(Object.is(undefined, s2[0]));
  }

  {
    let a = [1,2,3];
    let s3 = new Stack(a, 'ignored arg');
    arktest.assertTrue(Object.is(Stack.prototype, s3.__proto__));
    arktest.assertTrue(Array.isArray(s3));
    arktest.assertTrue(Object.is(1, s3.length));
    arktest.assertTrue(Object.is(a, s3[0]));
  }
}());


(function TestMultipleArgsSuper() {
  class Stack extends Array {
    constructor(x, y, z) {
      super(x, y, z);
    }
  }
  {
    let s4 = new Stack(1, 2, 3, 4, 5);
    arktest.assertTrue(Object.is(Stack.prototype, s4.__proto__));
    arktest.assertTrue(Array.isArray(s4));
    arktest.assertTrue(Object.is(3, s4.length));
    arktest.assertTrue(Object.is(1, s4[0]));
    arktest.assertTrue(Object.is(2, s4[1]));
    arktest.assertTrue(Object.is(3, s4[2]));
  }

  {
    let s5 = new Stack(undefined);
    arktest.assertTrue(Object.is(Stack.prototype, s5.__proto__));
    arktest.assertTrue(Array.isArray(s5));
    arktest.assertTrue(s5.__proto__ == Stack.prototype);
    arktest.assertTrue(Object.is(3, s5.length));
    arktest.assertTrue(Object.is(undefined, s5[0]));
    arktest.assertTrue(Object.is(undefined, s5[1]));
    arktest.assertTrue(Object.is(undefined, s5[2]));
  }
}());


(function TestArrayConcat() {
  class Stack extends Array { }
  let s1 = new Stack(1,2,3);

  let concatA = s1.concat([4,5,6]);
  arktest.assertEQ(6, concatA.length);
  arktest.assertEQ(1, concatA[0]); arktest.assertEQ(2, concatA[1]);
  arktest.assertEQ(3, concatA[2]); arktest.assertEQ(4, concatA[3]);
  arktest.assertEQ(5, concatA[4]); arktest.assertEQ(6, concatA[5]);
  let concatB = [4,5,6].concat(s1);
  arktest.assertEQ(6, concatB.length);
  arktest.assertEQ(4, concatB[0]); arktest.assertEQ(5, concatB[1]);
  arktest.assertEQ(6, concatB[2]); arktest.assertEQ(1, concatB[3]);
  arktest.assertEQ(2, concatB[4]); arktest.assertEQ(3, concatB[5]);
}());


(function TestJSONStringify() {
  class Stack extends Array { }

  let s1 = new Stack(1,2,3);
  arktest.assertTrue(Object.is('[1,2,3]', JSON.stringify(s1)));
}());
