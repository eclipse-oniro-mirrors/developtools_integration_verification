/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/*---
desc: The `let` token is disallowed when not followed by a `[` token
tags: [compile-only, negative]
expected_out_1: [
    "Syntax error ESY0105: Variable must be initialized or it's type must be declared.",
    "Syntax error ESY0230: Expected ';', got '['.",
    "Syntax error ESY0228: Unexpected token, expected ';'.",
    "Syntax error ESY0230: Expected ')', got '}'.",
    "Syntax error ESY0227: Unexpected token '}'.",
    "Syntax error ESY0230: Expected '}', got 'end of stream'.",
]
---*/

function main(): void {
    for (let of [1]) {
    }
}
