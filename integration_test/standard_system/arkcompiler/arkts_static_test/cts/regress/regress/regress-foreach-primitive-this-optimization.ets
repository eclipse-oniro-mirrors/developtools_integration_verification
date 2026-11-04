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

function callback() {
  'use strict'
}

function foo(x) {
  // array.forEach with an untagged `this` arg and no receiver conversion should
  // compile successfully.
  x = x << 1;
  [''].forEach(callback, x);
}

ArkTools.prepareFunctionForOptimization(callback);
ArkTools.prepareFunctionForOptimization(foo);
foo(0);
foo(0);
ArkTools.optimizeFunctionOnNextCall(foo);
foo(0);
