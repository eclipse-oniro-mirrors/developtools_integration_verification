/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
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
// arktsid: substring_applied_to_array_n
// description: String.prototype.substring applied to an Array instance is rejected at compile time (generic method
// unavailable)
// Conversion notes: test262 assigns String.prototype.substring to an Array instance; ArkTS substring exists only on
// String

/*---
desc: String.prototype.substring applied to an Array instance is rejected at compile time (generic method unavailable)
tags: [compile-only, negative]
expected_out_1: ["Semantic error ESE0087: Property 'substring' does not exist on type 'Array'"]
---*/

function main(): void {
    let arr: number[] = [1, 2, 3, 4, 5];
    arr.substring(9, -Infinity);
}
