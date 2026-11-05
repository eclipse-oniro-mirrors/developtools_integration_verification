/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/*---
desc: A for-of head cannot contain a second expression after the iterable
tags: [compile-only, negative]
expected_out_1: [
    "Syntax error ESY0230: Expected ')', got ','.",
    "Syntax error ESY0227: Unexpected token ','.",
    "Semantic error ESE0252: Indexed access is not supported for such expression type.",
    "Syntax error ESY0227: Unexpected token ')'.",
    "Syntax error ESY0227: Unexpected token '{'.",
]
---*/

function main(): void {
    for (let x of [1], [2]) {
    }
}
