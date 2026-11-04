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
desc: Exponentiation Expression syntax error, `+` UnaryExpression used as the left operand of ** without parentheses
tags: [compile-only, negative]
expected_out_1: |-
    Syntax error ESY0196: Illegal expression. Wrap left hand side or entire exponentiation in parentheses.
---*/

function main(): void {
    let r: double = +1 ** 2;
}
