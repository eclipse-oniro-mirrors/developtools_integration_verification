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
desc: Rest parameter must be the last formal parameter
tags: [compile-only, negative]
expected_out_1: |-
    Semantic error ESE0017: Only abstract or native methods can't have body.
    Syntax error ESY0067: Rest parameter must be the last formal parameter.
    Syntax error ESY0038: Label must be followed by a loop statement.
    Syntax error ESY0227: Unexpected token 'int'.
    Syntax error ESY0227: Unexpected token ')'.
    Syntax error ESY0227: Unexpected token ':'.
    Syntax error ESY0227: Unexpected token 'void'.
    Syntax error ESY0227: Unexpected token '{'.
---*/
function invalid(first: int, ...rest: int[], c: int): void {
}
