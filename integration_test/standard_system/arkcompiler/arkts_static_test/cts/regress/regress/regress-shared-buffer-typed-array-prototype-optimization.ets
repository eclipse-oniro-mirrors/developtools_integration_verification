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
expected_out_1: "Semantic error ESE0371: Cannot find type 'SharedArrayBuffer'."
---*/

const buf = new SharedArrayBuffer(8, { 'maxByteLength': 8 });

class Obj extends Uint8ClampedArray {
  constructor() {
    super(buf);
  }
  defineProperty() {
    for (let i = 0; i < 3; i++) {
      super.length;
    }
    SharedArrayBuffer.__proto__ = this;
  }
}

function opt() {
  new Obj().defineProperty();
}

ArkTools.prepareFunctionForOptimization(opt);
opt();
opt();
opt();
opt();
ArkTools.optimizeFunctionOnNextCall(opt)
opt();
