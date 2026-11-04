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
desc: a coalesce expression cannot be followed by || without parentheses (0 ?? 0 || true)
tags: [compile-only, negative]
expected_out_1: |-
    Semantic error ESE0346: Wrong type of operands for binary expression
    Syntax error ESY0059: Nullish coalescing operator ?? requires parens when mixing with logical operators.
---*/

// test262: test/language/expressions/coalesce/cannot-chain-tail-with-logical-or.js
function main(): void {
    0 ?? 0 || true;
}
