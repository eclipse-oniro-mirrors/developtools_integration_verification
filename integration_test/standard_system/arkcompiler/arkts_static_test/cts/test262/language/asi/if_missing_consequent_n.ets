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
desc: An if statement cannot omit its consequent before else
tags: [compile-only, negative]
expected_out_1: ["Syntax error ESY0227: Unexpected token 'else'.", "Syntax error ESY0227: Unexpected token 'c'."]
---*/

function main(): void {
    let a: int = 1;
    let b: int = 2;
    let c: int = 3;
    let d: int = 4;
    if (a > b)
    else c = d;
}
