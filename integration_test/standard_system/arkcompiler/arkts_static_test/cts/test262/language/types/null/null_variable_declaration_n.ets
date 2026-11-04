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

/*---
desc: A variable cannot be declared with the reserved word null
tags: [compile-only, negative]
expected_out_1: [
    "Syntax error ESY0224: Identifier expected, got 'null'.",
    "Syntax error ESY0315: Number, string or computed value property name 'null' is not allowed, use classes to
    access data by property names that are identifiers",
    "Syntax error ESY0105: Variable must be initialized or it's type must be declared.",
]
---*/

function main(): void {
    let null;
}
