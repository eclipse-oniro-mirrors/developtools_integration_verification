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

(function BinopInEffectContextDeoptAndOsr() {
  function f(a, deopt, osr) {
    const result = (a + 10, 'result');
    const dummy = deopt + 0;
    for (let i = 0; osr && i < 2; i++) {
      ArkTools.prepareFunctionForOptimization(f);
      ArkTools.optimizeOsr();
    }
    return result;
  }

  ArkTools.prepareFunctionForOptimization(f);
  arktest.assertEQ('result', f(true, 3, false));
  arktest.assertEQ('result', f(true, 3, false));
  ArkTools.optimizeFunctionOnNextCall(f);
  arktest.assertEQ('result', f(true, 'foo', true));
})();


(function BinopInEffectContextLazyDeopt() {
  function deoptF() {
    ArkTools.deoptimizeFunction(f);
    return 'dummy';
  }

  function h() {
    return { toString : deoptF };
  }

  function g(x) {
  }

  function f() {
    return g(void(h() + ''));
  };
  ArkTools.prepareFunctionForOptimization(f);

  f();
  ArkTools.optimizeFunctionOnNextCall(f);
  f();
})();
