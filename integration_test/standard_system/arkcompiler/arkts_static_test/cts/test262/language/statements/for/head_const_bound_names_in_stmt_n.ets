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
desc: The body may not re-declare variables declared in the head
tags: [compile-only, negative]
expected_out_1: |-
    Syntax error ESY0297: 'var' keyword is not supported. Use 'let' instead.
    Syntax error ESY0105: Variable must be initialized or it's type must be declared.
---*/

function main(): void {
    for (const x: int = 0; false;) {
        var x;
    }
}
