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
// arktsid: string_trim_exists_as_function_n
// description: String.prototype.trim as a method value reference (JS typeof f === "function") is rejected at compile
// time (prototype value access, ESY30818)
// Conversion notes: test262 15.5.4.20-0-1 — ArkTS cannot take a method value reference to a built-in prototype member

/*---
desc: |
    String.prototype.trim as a method value reference (JS typeof f === "function") is rejected at compile time
    (prototype value access, ESY30818)
tags: [compile-only, negative]
expected_out_1: |-
    Semantic error ESE0087: Property 'prototype' does not exist on type 'String'
    Syntax error ESY30818: Runtime prototype assignment is not supported because of static typing
---*/

function main(): void {
    let f = String.prototype.trim;
}
