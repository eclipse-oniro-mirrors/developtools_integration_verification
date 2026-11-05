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
expected_out_1: "Syntax error ESY167720: Omitted elements are not supported in arrays."
---*/

let values: int[] = [,,];


// Test spreading of holey arrays. Holes should be replaced with undefined.

const a = [, 2];

arktest.assertEQ([undefined, 2], [...a]);
arktest.assertTrue([...a].hasOwnProperty(0));
arktest.assertTrue([2, ...a].hasOwnProperty(1));


class MyArray1 extends Array {
  constructor(a) {
    super(...a);
  }
}
let myarr1 = new MyArray1(a);
arktest.assertEQ(undefined, myarr1[0]);
arktest.assertTrue(myarr1.hasOwnProperty(0));


class MyArray2 extends Array {
  constructor(a) {
    super(2, ...a);
  }
}
let myarr2 = new MyArray2(a);
arktest.assertEQ(undefined, myarr2[1]);
arktest.assertTrue(myarr2.hasOwnProperty(1));

function foo0() { return arguments.hasOwnProperty(0); }
arktest.assertTrue(foo0(...a));

function foo1() { return arguments.hasOwnProperty(1); }
arktest.assertTrue(foo1(2, ...a));

// This test pollutes the Array prototype. No more tests should be run in the
// same instance after this.
a.__proto__[0] = 1;
let arr2 = [...a];
arktest.assertEQ([1,2], arr2);
arktest.assertTrue(arr2.hasOwnProperty(0));

myarr1 = new MyArray1(a);
arktest.assertEQ(1, myarr1[0]);
arktest.assertTrue(myarr1.hasOwnProperty(0));

let myarr2 = new MyArray2(a);
arktest.assertEQ(1, myarr2[1]);
arktest.assertTrue(myarr2.hasOwnProperty(1));

(() => {
let values: int[] = [,,];


const arr = new Array(2e5);

for (let i = 0; i < 10; i++) {
  arr[i] = i;
}

let arr2 = [...arr];
arktest.assertTrue(arr2.hasOwnProperty(10));
arktest.assertEQ(undefined, arr2[10]);
arktest.assertEQ(9, arr2[9]);
})();

(() => {
for (let x: int = 0; x < 10000; ++x) {
  const sparse: Any[] = [, 4294967295];
  const values: Any[] = [(x: Long) => x, sparse.find((x: Any): boolean => true), , 2];
  values.includes('x', -0);
}
})();

(() => {
let arr: double[] = [, 0.1];

Array.prototype.lastIndexOf.call(arr, 100, {
  valueOf(): void {
    arr.length = 0;
  }
});
})();

(() => {
let array: double[] = [, 0.5];
array.length = 0;
array.forEach((_, arrayIndex) => {
  let i = arrayIndex.toString();
});
})();
