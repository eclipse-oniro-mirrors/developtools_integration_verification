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
desc: leading `async` token in for-of LHS
tags: [compile-only, negative]
expected_out_1: [
    "Syntax error ESY0316: Hard keyword 'async' cannot be used as identifier",
    "Syntax error ESY0224: Identifier expected, got 'async'.",
    "Syntax error ESY0228: Unexpected token, expected '('.",
    "Syntax error ESY0230: Expected '=>', got '['.",
    "Syntax error ESY0229: Unexpected token, expected ',' or ')'.",
    "Syntax error ESY0112: Unexpected token, expected an identifier.",
    "Syntax error ESY0167: Invalid left-hand side in 'For[In/Of]Statement'.",
]
---*/

function main(): void {
    let async: int = 0;
    for (async of [1]) {
    }
}
