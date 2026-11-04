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

{
  function f() {
    const b = BigInt.asUintN(4,3n);
    let i = 0;
    while(i < 1) {
      i + 1;
      i = b;
    }
  }

  ArkTools.prepareFunctionForOptimization(f);
  f();
  f();
  ArkTools.optimizeFunctionOnNextCall(f);
  f();
}


{
  function f() {
    const b = BigInt.asUintN(4,10n);
    let i = 0.1;
    while(i < 1.8) {
      i + 1;
      i = b;
    }
  }

  ArkTools.prepareFunctionForOptimization(f);
  f();
  f();
  ArkTools.optimizeFunctionOnNextCall(f);
  f();
}
