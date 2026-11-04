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

function foo(array) {
  return array[0];
};
ArkTools.prepareFunctionForOptimization(foo);
const a = [1, 2, , 4];  // Holey Smi elements.
const b = ['abcd', 0];  // Fast elements.
foo(b);  // Observe fast elements first, or the IC will transition without
foo(a);  // going polymorphic.
ArkTools.optimizeFunctionOnNextCall(foo);
const c = [, 0];
arktest.assertEQ(undefined, foo(c));  // Elided hole check will leak the hole.
