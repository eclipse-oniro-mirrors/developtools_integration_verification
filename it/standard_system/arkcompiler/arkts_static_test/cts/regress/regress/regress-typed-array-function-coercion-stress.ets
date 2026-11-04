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
expected_out_1: "Syntax error ESY0135: Nested functions are not allowed."
---*/

const v2 = new Uint8ClampedArray(216);
const v5 = new BigInt64Array(5);
const vEight = new Uint32Array(2);
for (let v9 = 0; v9 < 5; v9++) {
  const v12 = new Float32Array(4096);
  function f13() {
    return f13;
  }
  const v14 = f13();
  const v16 = 7 * v14;
  const v17 = +v16;
  const v18 = 4096 + v14;
  const v19 = v18 * v17;
  class C21 extends Array {
    constructor(a23, a24, a25, a26) {
      super();
      v18.toLowerCase(a24, 7, 7, f13);
    }
  }
  const v28 = new C21(v19, v16, 7, C21);
  const v31 = new Uint8Array(1073741824);
  for (let i = 0; i < 25; i++) {
    let v36 = ('valueOf')[216];
    for (let v37 = 0; v37 < 50; v37++) {
      for (let v38 = 0; v38 < 50; v38++) {
        v36 % (4096 >>> 4096);
        v36++;
      }
      0 == 99;
      class C45 {
      }
    }
  }
  Array(56393);
}
