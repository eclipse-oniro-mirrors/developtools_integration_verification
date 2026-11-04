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
desc: A continue statement must target an enclosing iteration statement
tags: [compile-only, negative]
expected_out_1: |-
    Syntax error ESY0038: Label must be followed by a loop statement.
    Semantic error ESE0143: Unresolved reference test262
---*/

function main(): void {
    do {
        test262: {
            continue test262;
        }
    } while (false);
}
