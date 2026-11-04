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
desc: A throw statement cannot contain a line terminator after throw
tags: [compile-only, negative]
expected_out_1: |-
    Semantic error ESE0205: Argument must be an instance of 'Exception' or 'Error'
    Syntax error ESY0172: Illegal newline after throw.
    Semantic error ESE33781: The catch statement with type annotation is deprecated, use catch(e) instead.
---*/

function main(): void {
    try {
        throw
        1;
    } catch (e: Error) {
    }
}
