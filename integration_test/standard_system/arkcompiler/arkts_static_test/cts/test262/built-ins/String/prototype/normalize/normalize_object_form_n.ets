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
// arktsid: normalize_object_form_n
// description: String.prototype.normalize with an object form argument is rejected at compile time
// Conversion notes: test262 ToString(form) propagates a throwing toString; ArkTS normalize
//   requires a String form, so an object argument is a compile-time type error

/*---
desc: String.prototype.normalize with an object form argument is rejected at compile time
tags: [compile-only, negative]
expected_out_1: [
    "Semantic error ESE0127: No matching call signature for normalize(Object)",
    "Semantic error ESE0046: Type 'Object' is not compatible with type 'String|undefined' at index 1",
]
---*/

function main(): void {
    let form: Object = {};
    let s: string = 'foo'.normalize(form);
}
