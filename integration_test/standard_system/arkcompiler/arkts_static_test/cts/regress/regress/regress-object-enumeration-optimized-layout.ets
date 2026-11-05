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
expected_out_1: "Semantic error ESE0203: Cannot reference 'this' in this context."
---*/

function F() { this.x = 1; }
for (let i = 0; i < 10; i++) { new F(); }

function foo() {
  const obj = new F();
  obj.y = -1073741825;
  return obj;
}

function bar(t) {
  const arr = [];
  for (let p in t){
    arr.push([ t[p]]);
  }
  return arr;
}

function test() {
  return bar(foo());
}

ArkTools.prepareFunctionForOptimization(F);
ArkTools.prepareFunctionForOptimization(foo);
ArkTools.prepareFunctionForOptimization(bar);
ArkTools.prepareFunctionForOptimization(test);
arktest.assertEQ([[1], [-1073741825]], test(foo, bar));
ArkTools.optimizeFunctionOnNextCall(test);
arktest.assertEQ([[1], [-1073741825]], test(foo, bar));
