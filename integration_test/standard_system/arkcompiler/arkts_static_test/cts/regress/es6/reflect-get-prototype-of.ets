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

// Tests the Reflect.getPrototypeOf - ES6 26.1.8.
// This is adapted from mjsunit/get-prototype-of.js.

/*---
tags: [compile-only, negative]
expected_out_1: "Syntax error ESY0194: Parameter declaration should have an explicit type annotation."
---*/

function assertPrototypeOf(func, expected) {
  arktest.assertEQ(expected, Reflect.getPrototypeOf(func));
}


arktest.expectThrow(function() {
  Reflect.getPrototypeOf(undefined);
}, ((e: Error): boolean => e instanceof TypeError));


arktest.expectThrow(function() {
  Reflect.getPrototypeOf(null);
}, ((e: Error): boolean => e instanceof TypeError));


function F(){};
const y = new F();

assertPrototypeOf(y, F.prototype);
assertPrototypeOf(F, Function.prototype);

assertPrototypeOf({x: 5}, Object.prototype);
assertPrototypeOf({x: 5, __proto__: null}, null);

assertPrototypeOf([1, 2], Array.prototype);


arktest.expectThrow(function () {
  Reflect.getPrototypeOf(1);
}, ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow(function () {
  Reflect.getPrototypeOf(true);
}, ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow(function () {
  Reflect.getPrototypeOf(false);
}, ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow(function () {
  Reflect.getPrototypeOf('str');
}, ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow(function () {
  Reflect.getPrototypeOf(Symbol());
}, ((e: Error): boolean => e instanceof TypeError));

assertPrototypeOf(Object(1), Number.prototype);
assertPrototypeOf(Object(true), Boolean.prototype);
assertPrototypeOf(Object(false), Boolean.prototype);
assertPrototypeOf(Object('str'), String.prototype);
assertPrototypeOf(Object(Symbol()), Symbol.prototype);


const errorFunctions = [
  EvalError,
  RangeError,
  ReferenceError,
  SyntaxError,
  TypeError,
  URIError,
];

for (let f of errorFunctions) {
  assertPrototypeOf(f, Error);
  assertPrototypeOf(new f(), f.prototype);
}


// Builtin constructors.
const functions = [
  Array,
  ArrayBuffer,
  Boolean,
  // DataView,
  Date,
  Error,
  // Float32Array, prototype is ArkTools.typedArray%
  // Float64Array,
  Function,
  // Int16Array,
  // Int32Array,
  // Int8Array,
  Map,
  Number,
  Object,
  // Promise,
  RegExp,
  Set,
  String,
  // Symbol, not constructible
  // Uint16Array,
  // Uint32Array,
  // Uint8Array,
  // Uint8ClampedArray,
  WeakMap,
  WeakSet,
];

for (let f of functions) {
  assertPrototypeOf(f, Function.prototype);
  assertPrototypeOf(new f(), f.prototype);
}

const p = new Promise(function() {});
assertPrototypeOf(p, Promise.prototype);

const dv = new DataView(new ArrayBuffer());
assertPrototypeOf(dv, DataView.prototype);
