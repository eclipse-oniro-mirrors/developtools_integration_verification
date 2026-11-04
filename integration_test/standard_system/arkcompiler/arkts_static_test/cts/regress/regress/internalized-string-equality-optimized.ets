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


// A bug in r15773, when masks for internalized string and string types
// were reorganized.

/*---
tags: [compile-only, negative]
expected_out_1: "Syntax error ESY0194: Parameter declaration should have an explicit type annotation."
---*/

function equal(o1, o2) {
  return o1 == o2;
};
ArkTools.prepareFunctionForOptimization(equal);
const a = 'abc';
const b = 'abc';
equal(a, b);
equal(a, b);
ArkTools.optimizeFunctionOnNextCall(equal);
arktest.assertTrue(equal(1.3, 1.3));
