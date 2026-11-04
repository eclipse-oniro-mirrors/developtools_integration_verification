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

(function() {
  const arr = [0, 1, , 3];
  Array.prototype[2] = 2;

  const constructors = [
    Uint8Array,
    Int8Array,
    Uint16Array,
    Int16Array,
    Uint32Array,
    Int32Array,
    Float32Array,
    Float64Array,
    Uint8ClampedArray
  ];

  for (let constr of constructors) {
    const ta = new constr(arr);
    arktest.assertEQ([0, 1, 2, 3], ta);
  }
})();

(function testTypedArrayConstructByArrayLikeInvalidArrayProtector() {
  Array.prototype[2] = undefined;
  load('test/mjsunit/es6/typedarray-construct-by-array-like.js');
})();
