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
    Array.isArray(Math) (JS false) - ArkTS Math is a class and cannot be used as an object argument, compile-time
    negative
tags: [compile-only, negative]
expected_out_1: [
    "Semantic error ESE0127: No matching call signature for isArray(Math)",
    "Semantic error ESE132307: Class 'Math' cannot be used as object",
    "Semantic error ESE0122: Class name can't be the argument of function or method.",
]
---*/

function main(): void {
    let r: boolean = Array.isArray(Math);
}
