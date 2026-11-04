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
desc: Expression not allowed in head's AssignmentExpression position
tags: [compile-only, negative]
expected_out_1: [
    "Semantic error ESE0143: Unresolved reference var",
    "Syntax error ESY0230: Expected ';', got 'identification literal'.",
    "Semantic error ESE0143: Unresolved reference x",
    "Syntax error ESY0227: Unexpected token 'of'.",
]
---*/

function main(): void {
    for (var x of [], [1]) {
    }
}
