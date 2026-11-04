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
desc: The `async` contextual keyword must not contain Unicode escape sequences.
tags: [compile-only, negative]
expected_out_1: [
    "Syntax error ESY0271: Escape sequences are not allowed in keyword.",
    "Semantic error ESE0143: Unresolved reference async",
    "Syntax error ESY0227: Unexpected token 'function'.",
]
---*/

// Conversion notes: `\u0061sync` 转义关键字字面文本（ESY0271）
\u0061sync function f(): Promise<void> {
}

function main(): void {
}
