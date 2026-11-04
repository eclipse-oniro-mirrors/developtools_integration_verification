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
// arktsid: invalid_names_member_bad_reference_n
// description: bad reference in member expression (Invalid private names should throw a SyntaxError, inside function
// declaration)
// Conversion notes: 私有名 #x 引用（member 表达式 + 坏引用）

/*---
desc: bad reference in member expression (Invalid private names should throw a SyntaxError, inside function declaration)
tags: [compile-only, negative]
expected_out_1: |-
    Semantic error ESE0143: Unresolved reference something
    Syntax error ESY0224: Identifier expected, got '.'.
    Syntax error ESY0122: Identifier expected.
    Syntax error ESY0298: Use 'private' keyword to declare an identifier as private.
    Syntax error ESY0227: Unexpected token 'x'.
    Semantic error ESE0143: Unresolved reference x
---*/

function fn(): void {
    something.#x
}

function main(): void {
}
