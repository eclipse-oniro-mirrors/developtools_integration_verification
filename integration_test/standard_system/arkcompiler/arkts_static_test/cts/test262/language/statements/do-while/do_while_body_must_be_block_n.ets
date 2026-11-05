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
desc: A do-while body must be a compound statement
tags: [compile-only, negative]
expected_out_1:
  - "Syntax error ESY0175: Lexical declaration is not allowed in single statement context."
  - "Syntax error ESY0228: Unexpected token, expected 'while'."
  - "Syntax error ESY0228: Unexpected token, expected '('."
  - "Syntax error ESY0230: Expected ')', got 'int'."
  - "Syntax error ESY0301: Missing condition in do while statement"
  - "Syntax error ESY0227: Unexpected token 'int'."
---*/

function main(): void {
    do let x: int = 1; let y: int = 2; while (false);
}
