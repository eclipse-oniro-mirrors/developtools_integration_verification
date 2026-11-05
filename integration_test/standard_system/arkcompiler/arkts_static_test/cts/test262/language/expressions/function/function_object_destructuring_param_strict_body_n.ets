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
// arktsid: function_object_destructuring_param_strict_body_n
// description: ObjectBindingPattern and Use Strict Directive are not allowed to coexist for the same function.
// (function expression)
// Conversion notes: ObjectBindingPattern 参数 + use strict（错误链复用 statements/function 已实测，不可外推）

/*---
desc: |
    ObjectBindingPattern and Use Strict Directive are not allowed to coexist for the same function. (function
    expression)
tags: [compile-only, negative]
expected_out_1: |-
    Syntax error ESY0194: Parameter declaration should have an explicit type annotation.
    Syntax error ESY0229: Unexpected token, expected ',' or ')'.
    Syntax error ESY0112: Unexpected token, expected an identifier.
    Semantic error ESE0143: Unresolved reference a
    Syntax error ESY0227: Unexpected token ':'.
    Syntax error ESY0227: Unexpected token '{'.
    Syntax error ESY0038: Label must be followed by a loop statement.
    Semantic error ESE0144: Type name 'number' used in the wrong context
    Syntax error ESY0227: Unexpected token ')'.
    Syntax error ESY0227: Unexpected token 'void'.
---*/

function f({ a }: { a: number }): void {
    'use strict';
}

function main(): void {
}
