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
// arktsid: invalid_name_two_dots_n
// description: 13.0 - multiple names in one function declaration is not allowed,
// Conversion notes: 13.0 双点属性名函数声明语法早期错误

/*---
desc: 13.0 - multiple names in one function declaration is not allowed,
tags: [compile-only, negative]
expected_out_1: [
    "Semantic error ESE0017: Only abstract or native methods can't have body.",
    "Syntax error ESY0228: Unexpected token, expected '('.",
    "Syntax error ESY0194: Parameter declaration should have an explicit type annotation.",
    "Syntax error ESY0227: Unexpected token '.'.",
    "Syntax error ESY0229: Unexpected token, expected ',' or ')'.",
    "Syntax error ESY0227: Unexpected token 'ss'.",
    "Semantic error ESE0143: Unresolved reference ss",
    "Syntax error ESY0227: Unexpected token ':'.",
    "Syntax error ESY0227: Unexpected token 'void'.",
    "Syntax error ESY0227: Unexpected token '{'.",
]
---*/

function obj.tt.ss(): void {
}

function main(): void {
}
