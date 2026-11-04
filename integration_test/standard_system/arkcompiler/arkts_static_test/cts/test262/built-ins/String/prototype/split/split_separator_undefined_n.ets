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
// arktsid: split_separator_undefined_n
// description: String.prototype.split with an undefined separator is rejected at compile time (separator arg required)
// Conversion notes: test262: split()/split(undefined) returns [S]; ArkTS split requires a String|RegExp separator,
// undefined is not compatible
// Conversion notes: test262: split()/split(undefined) returns [S]; ArkTS split requires a String|RegExp separator,
// undefined is not compatible

/*---
desc: String.prototype.split with an undefined separator is rejected at compile time (separator arg required)
tags: [compile-only, negative]
expected_out_1: [
    "Semantic error ESE0127: No matching call signature for split(undefined)",
    "Semantic error ESE0046: Type 'undefined' is not compatible with type 'String|RegExp' at index 1",
]
---*/

function main(): void {
    let s: string = 'undefined is not a function';
    s.split(undefined);
}
