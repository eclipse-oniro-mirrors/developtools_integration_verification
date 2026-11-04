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
desc: "Duplicate arrow parameter name via a rest element is a SyntaxError (test262 early error): `(x, ...x) => 1`"
tags: [compile-only, negative]
expected_out_1: ["Semantic error ESE0351: Variable 'x' has already been declared."]
---*/

function main(): void {
    let af = (x: int, ...x: int[]) => 1;
}
