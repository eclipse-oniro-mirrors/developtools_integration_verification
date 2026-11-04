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
desc: ExpressionStatement has a lookahead restriction for `let [`.
tags: [compile-only, negative]
expected_out_1: |-
    Semantic error ESE0143: Unresolved reference var
    Syntax error ESY0230: Expected ';', got 'identification literal'.
    Semantic error ESE0143: Unresolved reference x
    Semantic error ESE0252: Indexed access is not supported for such expression type.
    Semantic error ESE0143: Unresolved reference of
    Syntax error ESY0175: Lexical declaration is not allowed in single statement context.
    Syntax error ESY0049: Invalid destructuring assignment target.
---*/

function main(): void {
    for (var x of [1]) {
    let [a] = 0;
    }
}
