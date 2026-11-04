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

// Transitioning from a PackedSmi to PackedDouble should fill the destination
// with holes.
//

/*---
tags: [compile-only, negative]
expected_out_1: "Semantic error ESE0318: Type 'Double' cannot be assigned to type 'Int'"
---*/

let arr: Double[] = [];
arr[0] = 0;
arr[0] = 1.1;
let hole: int = arr[1];
arktest.assertEQ(undefined, hole);

(() => {
let array: double[] = [];
array.length = 0.6e+7;
array.push();
arktest.assertEQ(array.length, 0.6e+7);
})();
