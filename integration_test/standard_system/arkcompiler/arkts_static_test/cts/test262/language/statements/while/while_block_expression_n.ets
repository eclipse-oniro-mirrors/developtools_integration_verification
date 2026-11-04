/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may obtain a copy of the License at
 * http://www.apache.org/licenses/LICENSE-2.0
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/*---
desc: A block literal is not allowed as a while condition expression
tags: [compile-only, negative]
expected_out_1: [
    "Semantic error ESE0062: need to specify target type for class composite",
    "Syntax error ESY0228: Unexpected token, expected ':'.",
    "Syntax error ESY0227: Unexpected token ')'.",
    "Syntax error ESY0016: Unexpected token.",
    "Syntax error ESY0230: Expected ')', got 'break'.",
    "Syntax error ESY0227: Unexpected token '}'.",
]
---*/

function main(): void {
    while ({1}) {
        break;
    }
}
