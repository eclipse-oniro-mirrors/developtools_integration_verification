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
expected_out_1: "Semantic error ESE0124: Expected 2 arguments, got 1."
---*/

function test() {
  const a = new DataView(new ArrayBuffer(32));
  const b = new DataView(new ArrayBuffer(32));
  a.setFloat64(0);
  b.setFloat64(0, undefined);

  for(let i = 0; i < 8; ++i) {
    arktest.assertEQ(a.getUint8(i), b.getUint8(i));
  }
}

ArkTools.prepareFunctionForOptimization(test);
test();
test();
ArkTools.optimizeFunctionOnNextCall(test);
test();
