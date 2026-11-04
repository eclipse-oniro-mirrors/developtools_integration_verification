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


// Test that Promises use @@species appropriately

// Another constructor with no species will not be instantiated

/*---
tags: [compile-only, negative]
expected_out_1: "Semantic error ESE0170: Type 'Promise<T>' is generic but type argument were not provided."
---*/

let test = new Promise(function(){});
let bogoCount = 0;
function bogusConstructor() { bogoCount++; }
test.constructor = bogusConstructor;
arktest.assertTrue(Promise.resolve(test) instanceof Promise);
arktest.assertFalse(Promise.resolve(test) instanceof bogusConstructor);
// Tests that chromium:575314 is fixed thoroughly
Promise.resolve(test).catch(e => ArkTools.abortJS('Error ' + e)).then(() => {
  if (bogoCount != 0) { ArkTools.abortJS('bogoCount was ' + bogoCount + ' should be 0'); }
});

// If there is a species, it will be instantiated
// @@species will be read exactly once, and the constructor is called with a
// function
let count = 0;
let params;
class MyPromise extends Promise {
  constructor(...args) {
    super(...args);
    params = args;
  }
  static get [Symbol.species]() {
    count++
    return this;
  }
}

const myPromise = MyPromise.resolve().then();
arktest.assertEQ(1, count);
arktest.assertEQ(1, params.length);
arktest.assertEQ('function', typeof(params[0]));
arktest.assertTrue(myPromise instanceof MyPromise);
arktest.assertTrue(myPromise instanceof Promise);
