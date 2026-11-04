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

(function(){
  function f(x) {
    return 'abcd'.charCodeAt(BigInt.asUintN(64, 10n));
  }

  ArkTools.prepareFunctionForOptimization(f);
  try { f(1); } catch(e) {}
  try { f(1); } catch(e) {}
  ArkTools.optimizeFunctionOnNextCall(f);
  arktest.expectThrow((): void => { f(); }, (e: Error): boolean => e instanceof TypeError);
})();


(function(){
  function f(x) {
    return 'abcd'.charCodeAt(BigInt.asUintN(2, 10n));
  }

  ArkTools.prepareFunctionForOptimization(f);
  try { f(1); } catch(e) {}
  try { f(1); } catch(e) {}
  ArkTools.optimizeFunctionOnNextCall(f);
  arktest.expectThrow((): void => { f(); }, (e: Error): boolean => e instanceof TypeError);
})();
