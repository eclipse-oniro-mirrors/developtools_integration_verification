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
// arktsid: substring_void0_end_arg_n
// description: String.prototype.substring with an undefined end argument (void 0) is rejected at compile time
// Conversion notes: test262 String(obj).substring(-4, void 0) == "undefined"; ArkTS end is Int, undefined is not
// compatible

/*---
desc: String.prototype.substring with an undefined end argument (void 0) is rejected at compile time
tags: [compile-only, negative]
expected_out_1: |-
    Semantic error ESE0127: No matching call signature for substring(Int, undefined)
    Semantic error ESE0046: Type 'undefined' is not compatible with type 'Int' at index 2
---*/

function main(): void {
    let s: string = 'undefined';
    s.substring(-4, undefined);
}
