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
// arktsid: substring_bool_undefined_args_n
// description: String.prototype.substring with boolean and undefined arguments is rejected at compile time (Boolean
// receiver coercion)
// Conversion notes: test262 Boolean instance "false", start true->1, end undefined->len, result "alse"; ArkTS start is
// Int, Boolean is not compatible

/*---
desc: |
    String.prototype.substring with boolean and undefined arguments is rejected at compile time (Boolean receiver
    coercion)
tags: [compile-only, negative]
expected_out_1: |-
    Semantic error ESE0127: No matching call signature for substring(Boolean, undefined)
    Semantic error ESE0046: Type 'Boolean' is not compatible with type 'Int' at index 1
---*/

function main(): void {
    let s: string = 'false';
    s.substring(true, undefined);
}
