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
desc: a call expression is not a valid assignment target in ArkTS
tags: [compile-only, negative]
expected_out_1: |-
    Semantic error ESE0025: Invalid left-hand side of assignment expression
    Syntax error ESY0072: Invalid left-hand side in assignment expression.
---*/

function f(): int {
    return 1;
}

function main(): void {
    f() = 5;
}
