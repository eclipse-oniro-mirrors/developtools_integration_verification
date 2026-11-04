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
expected_out_1: "Syntax error ESY0194: Parameter declaration should have an explicit type annotation."
---*/

'use strict';

function assertGetterName(expected, object, name) {
  let descr = Object.getOwnPropertyDescriptor(object, name);
  arktest.assertEQ(expected, descr.get.name);
}


function assertSetterName(expected, object, name) {
  let descr = Object.getOwnPropertyDescriptor(object, name);
  arktest.assertEQ(expected, descr.set.name);
}


assertGetterName('get byteLength', ArrayBuffer.prototype, 'byteLength');
assertGetterName('get size', Set.prototype, 'size');
assertGetterName('get size', Map.prototype, 'size');


let typedArray = Uint8Array.__proto__;

assertGetterName('get buffer', typedArray.prototype, 'buffer');
assertGetterName('get byteOffset', typedArray.prototype, 'byteOffset');
assertGetterName('get byteLength', typedArray.prototype, 'byteLength');
assertGetterName('get length', typedArray.prototype, 'length');
assertGetterName('get [Symbol.toStringTag]', typedArray.prototype, Symbol.toStringTag);


assertGetterName('get buffer', DataView.prototype, 'buffer');
assertGetterName('get byteOffset', DataView.prototype, 'byteOffset');
assertGetterName('get byteLength', DataView.prototype, 'byteLength');


assertGetterName('get __proto__', Object.prototype, '__proto__');
assertSetterName('set __proto__', Object.prototype, '__proto__');
