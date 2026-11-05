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

const typedArrayConstructors = [
  Uint8Array,
  Int8Array,
  Uint16Array,
  Int16Array,
  Uint32Array,
  Int32Array,
  Uint8ClampedArray,
  Float32Array,
  Float64Array];

function testTypedArrayMap(constructor) {
  arktest.assertEQ(1, constructor.prototype.map.length);

  let target;

  class EscapingArray extends constructor {
    constructor(...args) {
      super(...args);
      target = this;
    }
  }

  class DetachingArray extends constructor {
    static get [Symbol.species]() {
      return EscapingArray;
    }
  }

  arktest.expectThrow(function(){
    new DetachingArray(5).map(function(v,i,a){
      print(i);
      if (i == 1) {
        ArkTools.arrayBufferDetach(target.buffer);
      }
    })
  }, ((e: Error): boolean => e instanceof TypeError));

}

for (let i = 0; i < typedArrayConstructors.length; i++) {
  testTypedArrayMap(typedArrayConstructors[i]);
}
