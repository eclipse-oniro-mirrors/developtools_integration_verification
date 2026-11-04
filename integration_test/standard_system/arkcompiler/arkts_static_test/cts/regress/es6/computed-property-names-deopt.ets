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
expected_out_1: "Semantic error ESE0143: Unresolved reference Symbol"
---*/

let key = Symbol('deopt-key');




(function TestProtoDeopt() {
  const proto = {};

  function deoptMe() {
    ArkTools.deoptimizeFunction(f);
    return proto;
  }

  function checkObject(name, value, o) {
arktest.assertEQ(proto, Object.getPrototypeOf(o));
    arktest.assertTrue(o.hasOwnProperty(name));
    arktest.assertEQ(value, o[name]);
  }

  function f(name, value) {
    return { [name]: value, __proto__: deoptMe() };
  }

  ArkTools.prepareFunctionForOptimization(f);
  checkObject('a', 1, f('a', 1));
  checkObject('b', 2, f('b', 2));
  ArkTools.optimizeFunctionOnNextCall(f);
  checkObject('c', 3, f('c', 3));
})();
