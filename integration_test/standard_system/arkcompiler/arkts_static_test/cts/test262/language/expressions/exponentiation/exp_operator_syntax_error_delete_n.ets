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
desc: |
    Exponentiation Expression, `delete` used as the left operand of ** (test262
    exp-operator-syntax-error-delete-unary-expression-base.js is a JS parse-negative). ArkTS rejects `delete` at
    runtime-type level (ESE55815) plus the undeclared `o` reference; the JS precedence early-error itself does not
    appear. Body kept verbatim from test262 (o intentionally undeclared). Probe-verified.
tags: [compile-only, negative]
expected_out_1: |-
    Semantic error ESE55815: Types cannot be modified at runtime with 'delete'.
    Syntax error ESY0227: Unexpected token 'o'.
    Semantic error ESE0143: Unresolved reference o
---*/

// test262: test/language/expressions/exponentiation/exp-operator-syntax-error-delete-unary-expression-base.js
function main(): void {
    let r: double = delete o.p ** 2;
}
