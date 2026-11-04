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
expected_out_1: "Syntax error ESY0318: Class cannot be used as object."
---*/

let funcs = [

  // https://upstream issue tracker/issues/detail?id=4002
  // Error,
  // EvalError,
  // RangeError,
  // ReferenceError,
  // SyntaxError,
  // TypeError,
  // URIError,

  // https://upstream issue tracker/issues/detail?id=4003
  // RegExp,

  // https://upstream issue tracker/issues/detail?id=4004
  // Date,

  // https://upstream issue tracker/issues/detail?id=4006
  // String,

  // Boolean,
  // Number,
  // https://upstream issue tracker/issues/detail?id=4001

  ArrayBuffer,
  DataView,
  Float32Array,
  Float64Array,
  Int16Array,
  Int32Array,
  Int8Array,
  Map,
  Object,
  Promise,
  // Proxy,
  Set,
  Symbol,
  Uint16Array,
  Uint32Array,
  Uint8Array,
  Uint8ClampedArray,
  WeakMap,
  WeakSet,
];

for (let fun of funcs) {
  let p = fun.prototype;

  // @@toStringTag is tested separately, and interferes with this test.
  if (Symbol.toStringTag) { delete p[Symbol.toStringTag]; }
  arktest.assertEQ('[object Object]', Object.prototype.toString.call(p));
}


// These still have special prototypes for legacy reason.
let funcs = [
  Array,
  Function,
];

for (let fun of funcs) {
  let p = fun.prototype;
  arktest.assertEQ(`[object ${fun.name}]`, Object.prototype.toString.call(p));
}
