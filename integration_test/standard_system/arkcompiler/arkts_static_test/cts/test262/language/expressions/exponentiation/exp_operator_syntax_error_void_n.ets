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
    Exponentiation Expression, `void` used as the left operand of ** (test262
    exp-operator-syntax-error-void-unary-expression-base.js is a JS parse-negative). ArkTS has no `void` expression
    operator, so it is rejected at the token level - NOT the ESY0196 precedence error of the +/~ /! /typeof
    siblings. Probe-verified.
tags: [compile-only, negative]
expected_out_1: |-
    Syntax error ESY0227: Unexpected token 'void'.
    Syntax error ESY0227: Unexpected token '1'.
---*/

// test262: test/language/expressions/exponentiation/exp-operator-syntax-error-void-unary-expression-base.js
function main(): void {
    let r: double = void 1 ** 2;
}
