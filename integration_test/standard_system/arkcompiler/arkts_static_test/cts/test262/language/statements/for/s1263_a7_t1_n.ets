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
desc: Checking if execution of "for(index=0; index<10; index++; index--)" fails
tags: [compile-only, negative]
expected_out_1: [
    "Syntax error ESY0230: Expected ')', got ';'.",
    "Syntax error ESY0227: Unexpected token ')'.",
    "Syntax error ESY0227: Unexpected token '{'.",
]
---*/

function main(): void {
    let index: int = 0;
    for (index = 0; index < 10; index++; index--) {
    }
}
