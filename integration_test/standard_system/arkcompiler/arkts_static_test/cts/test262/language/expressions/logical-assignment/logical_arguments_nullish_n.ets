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
    ArkTS has no arguments object and no ??= operator; arguments ??= 20 is rejected at compile (test262
    lgcl-nullish-arguments-strict.js)
tags: [compile-only, negative]
expected_out_1: |-
    Semantic error ESE0143: Unresolved reference arguments
    Syntax error ESY0227: Unexpected token '??='.
---*/

// test262: test/language/expressions/logical-assignment/lgcl-nullish-arguments-strict.js
function main(): void {
    arguments ??= 20;
}
