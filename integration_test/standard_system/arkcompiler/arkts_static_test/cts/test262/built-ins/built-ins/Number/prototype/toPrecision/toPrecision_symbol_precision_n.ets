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
desc: |
    Number.prototype.toPrecision must return abrupt completion from ToInteger(Symbol precision) - ArkTS has no
    Symbol type, so the argument is rejected at compile time
tags: [compile-only, negative]
expected_out_1: [
    "Semantic error ESE0124: Expected 0 arguments, got 1.",
    "Semantic error ESE0127: No matching call signature for toPrecision(...)",
    "Semantic error ESE0143: Unresolved reference Symbol",
]
---*/

function main(): void {
    (0.0).toPrecision(Symbol('1'));
}
