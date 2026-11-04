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


// Object and array literals should be created using DefineOwnProperty, and
// therefore not hit setters in the prototype.

/*---
tags: [compile-only, negative]
expected_out_1: "Syntax error ESY0194: Parameter declaration should have an explicit type annotation."
---*/

function mkFail(message) {
  return function () { arktest.assertTrue(false, message); }
}

Object.defineProperty(Object.prototype, 'foo',
                      {get: mkFail('oget'), set: mkFail('oset')});
Object.defineProperty(Array.prototype, '2',
                      {get: mkFail('aget'), set: mkFail('aset')});

function inFunction() {
  for (let i = 0; i < 10; i++) {
    // in loop.
    let ja = JSON.parse('[1,2,3,4]');
    let jo = JSON.parse('{"bar": 10, "foo": 20}')
    let jop = JSON.parse('{"bar": 10, "__proto__": { }, "foo": 20}')
    let a = [1,2,3,4];
    let o = { bar: 10, foo: 20 };
    let op = { __proto__: { set bar(v) { arktest.assertTrue(false, 'bset'); } },
               bar: 10 };
  }
}

for (let i = 0; i < 10; i++) {
  // In global scope.
  let ja = JSON.parse('[1,2,3,4]');
  let jo = JSON.parse('{"bar": 10, "foo": 20}')
  let jop = JSON.parse('{"bar": 10, "__proto__": { }, "foo": 20}')
  let a = [1,2,3,4];
  let o = { bar: 10, foo: 20 };
  let op = { __proto__: { set bar(v) { arktest.assertTrue(false, 'bset'); } },
             bar: 10 };
  // In function scope.
  inFunction();
}
