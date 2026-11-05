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
desc: It is a Syntax Error if IsLabelledFunction(Statement) is true.
tags: [compile-only, negative]
expected_out_1: |-
    Syntax error ESY0038: Label must be followed by a loop statement.
    Syntax error ESY0135: Nested functions are not allowed.
---*/

function main(): void {
    for (const x of [1]) {
        label1: label2: function f() {
        }
    }
}
