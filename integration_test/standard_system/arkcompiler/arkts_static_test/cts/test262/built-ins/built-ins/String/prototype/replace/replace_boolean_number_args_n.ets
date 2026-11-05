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
// arktsid: replace_boolean_number_args_n
// description: String.prototype.replace with boolean searchValue and number replaceValue is rejected at compile time
// Conversion notes: test262 (S15.5.4.11_A1_T1) calls replace(true, 1) on an Object(true)
//   instance via dynamic this, relying on ToString coercion of both args; ArkTS replace
//   requires String/RegExp arguments, so the boolean and number are compile-time type errors

/*---
desc: String.prototype.replace with boolean and number arguments is rejected at compile time
tags: [compile-only, negative]
expected_out_1: |-
    Semantic error ESE0127: No matching call signature for replace(Boolean, Int)
    Semantic error ESE0046: Type 'Boolean' is not compatible with type 'String|RegExp' at index 1
---*/

function main(): void {
    let s: string = 'true'.replace(true, 1);
}
