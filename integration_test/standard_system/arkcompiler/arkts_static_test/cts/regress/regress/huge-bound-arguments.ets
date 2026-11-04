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
expected_out_1: "Semantic error ESE0143: Unresolved reference arguments"
---*/

'use strict'

function f() {
    return arguments;
}

let arr = [];
arr.length=0x8000;
let g = f.bind(null,...arr);

function test() {
    return g();
}

ArkTools.prepareFunctionForOptimization(f);
ArkTools.prepareFunctionForOptimization(test);
test();
ArkTools.optimizeFunctionOnNextCall(test);
arktest.assertEQ(test().length, arr.length);

(() => {
function f() {
    return arguments;
}

let arr = [];
arr.length=0x8000;
let g = f.bind(null,...arr);

function test() {
    return g();
}

ArkTools.prepareFunctionForOptimization(f);
ArkTools.prepareFunctionForOptimization(test);
test();
ArkTools.optimizeFunctionOnNextCall(test);
arktest.assertEQ(test().length, arr.length);
})();
