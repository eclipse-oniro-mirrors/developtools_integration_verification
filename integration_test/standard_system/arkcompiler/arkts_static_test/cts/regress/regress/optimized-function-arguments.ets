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


// Getting the arguments property of an optimized function should not crash,
// even if called through our optimized version of Function.prototype.apply.

/*---
tags: [compile-only, negative]
expected_out_1: "Semantic error ESE0087: Property 'apply' does not exist on type 'Function'"
---*/

function optimized() {
  return unoptimized.apply(null, arguments);
}
ArkTools.prepareFunctionForOptimization(optimized);

// It's not crucial that this is unoptimized.
function unoptimized() {
  with ({}) {
    return optimized.arguments;
  }
}

for (let i = 0; i < 5; ++i) {
  arktest.assertEQ(3, optimized(1, 2, 3).length);
}
ArkTools.optimizeFunctionOnNextCall(optimized);
arktest.assertEQ(3, optimized(1, 2, 3).length);
