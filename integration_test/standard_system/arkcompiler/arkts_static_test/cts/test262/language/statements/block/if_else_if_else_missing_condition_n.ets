/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may obtain a copy of the License at
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
desc: An if statement cannot have empty conditions in an else-if chain
tags: [compile-only, negative]
expected_out_1: [
    "Syntax error ESY0230: Expected '(', got '{'.",
    "Semantic error ESE0062: need to specify target type for class composite",
    "Syntax error ESY0230: Expected ')', got ';'.",
    "Syntax error ESY0230: Expected '(', got '{'.",
    "Semantic error ESE0062: need to specify target type for class composite",
    "Syntax error ESY0230: Expected ')', got 'else'.",
    "Syntax error ESY0227: Unexpected token 'else'.",
    "Syntax error ESY0227: Unexpected token '{'.",
]
---*/

function main(): void {
    if {};
    else if {
    } else {
    }
}
