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

function foo(o) {
  return o.foo1;
};
ArkTools.prepareFunctionForOptimization(foo);
function getter() {
  return this.x + this.z + foo2(this);
}

function foo2(o) {
  return o.a;
}

const o1 = {z: 0, x: 1};
const o2 = {z: 0, a: 1.5, x: 1};
const o3 = {z: 0, a: 1.5};
Object.defineProperty(o1, 'foo1', {get: getter});
Object.defineProperty(o2, 'foo1', {get: getter});

foo(o1);
foo(o1);
foo(o2);
ArkTools.clearFunctionFeedback(foo2);
foo2(o2);
foo2(o2);
foo2(o3);
ArkTools.optimizeFunctionOnNextCall(foo);
foo(o1);
