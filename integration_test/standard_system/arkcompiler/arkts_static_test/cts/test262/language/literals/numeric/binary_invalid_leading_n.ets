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
desc: A binary-integer-literal-like sequence cannot have a leading zero
tags: [compile-only, negative]
expected_out_1: [
    "Syntax error ESY0257: Implicit octal literal not allowed.",
    "Syntax error ESY0227: Unexpected token 'b0'.",
    "Semantic error ESE0143: Unresolved reference b0",
]
---*/

function main(): void {
    00b0;
}
