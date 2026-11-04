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

function f(deopt, osr) {
  const result = 'result';
  ArkTools.call(function() {}, 0, 0);
  const dummy = deopt + 0;
  for (let i = 0; osr && i < 2; i++) {
    ArkTools.prepareFunctionForOptimization(f);
    ArkTools.optimizeOsr();
  }
  return result;
}

ArkTools.prepareFunctionForOptimization(f);
arktest.assertEQ('result', f(3, false));
arktest.assertEQ('result', f(3, false));
ArkTools.optimizeFunctionOnNextCall(f);
arktest.assertEQ('result', f('foo', true));
