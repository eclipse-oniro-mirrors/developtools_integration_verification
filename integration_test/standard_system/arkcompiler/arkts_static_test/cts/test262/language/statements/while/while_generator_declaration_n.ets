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
desc: A generator declaration is not allowed as a while body
tags: [compile-only, negative]
expected_out_1: |-
    Syntax error ESY0173: Generators can only be declared at the top level or inside a block.
    Syntax error ESY0175: Lexical declaration is not allowed in single statement context.
    Syntax error ESY0135: Nested functions are not allowed.
    Syntax error ESY0300: Missing body in while statement
---*/

function main(): void {
    while (false) {
        function* g(): void {
    }
    }
}
