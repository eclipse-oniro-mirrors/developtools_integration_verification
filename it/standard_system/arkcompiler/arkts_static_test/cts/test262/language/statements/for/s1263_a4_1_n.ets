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
desc: Checking if execution of "for (var a in arr;1;){}" fails
tags: [compile-only, negative]
expected_out_1: [
    "Syntax error ESY6987: 'for ... in' loop is not supported, please use regular 'for' or 'for ... of ...' loop to
    iterate through arrays and iterable objects.",
    "Syntax error ESY0105: Variable must be initialized or it's type must be declared.",
    "Syntax error ESY0230: Expected ')', got ';'.",
    "Syntax error ESY0227: Unexpected token ')'.",
    "Syntax error ESY0227: Unexpected token '{'.",
    "Semantic error ESE0161: Control flow redirection statement can not be used out of loop or switch statement.",
]
---*/

function main(): void {
    let arr: number[] = [1, 2, 3, 4, 5];
    for (let a in arr; 1;) {
        break;
    }
}
