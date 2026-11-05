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

function opt(optParam){
  const v5 = [8];
  Object.defineProperty(v5, 'c', { writable: true, value: -4.1595484640962705e+307 });
  let v7 = false;
  let vEight = 0;

  for (let i = 0; i < 5; i++) {
    v5.length = vEight;
    vEight++;
    for (let v10 = 0; v10 < 32; v10++) {
      v5['p' + v10] = v10;
    }
  }
  return v5;
}
opt(false);
ArkTools.prepareFunctionForOptimization(opt);
opt(true);
ArkTools.optimizeFunctionOnNextCall(opt);
opt(false);
