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

// arktsid: fromcharcode_static_length_n
// description: String.fromCharCode.length static property reflection is rejected at compile time
// (overloaded-method-as-value, ESE0307)
// description: String.fromCharCode.length static property reflection is rejected at compile time
// (overloaded-method-as-value, ESE0307)

/*---
desc: |
    String.fromCharCode.length static property reflection is rejected at compile time (overloaded-method-as-value,
    ESE0307)
tags: [compile-only, negative]
expected_out_1: ["Semantic error ESE0307: Overloaded method is used as value"]
---*/

function main(): void {
    let n: number = String.fromCharCode.length;
}
