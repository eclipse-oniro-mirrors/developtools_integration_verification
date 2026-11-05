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

(function TestPrototypeSetter1() {
  Object.defineProperty(Array.prototype, 3, {set() {throw 666}})
  Object.defineProperty(Array.prototype, 4, {set() {throw 666}})

  function f() {
    return ['a', ...['b', 'c', 'd'], 'e']
  }

  ArkTools.prepareFunctionForOptimization(f);
  arktest.assertEQ(['a', 'b', 'c', 'd', 'e'], f());
  ArkTools.optimizeFunctionOnNextCall(f);
  arktest.assertEQ(['a', 'b', 'c', 'd', 'e'], f());

  delete Array.prototype[3];
  delete Array.prototype[4];
})();

(() => {
(function TestPrototypeSetter2() {
  Object.defineProperty(Array.prototype.__proto__, 3, {set() {throw 666}})
  Object.defineProperty(Array.prototype.__proto__, 4, {set() {throw 666}})

  function f() {
    return ['a', ...['b', 'c', 'd'], 'e']
  }

  ArkTools.prepareFunctionForOptimization(f);
  arktest.assertEQ(['a', 'b', 'c', 'd', 'e'], f());
  ArkTools.optimizeFunctionOnNextCall(f);
  arktest.assertEQ(['a', 'b', 'c', 'd', 'e'], f());

  delete Array.prototype.__proto__[3];
  delete Array.prototype.__proto__[4];
})();
})();
