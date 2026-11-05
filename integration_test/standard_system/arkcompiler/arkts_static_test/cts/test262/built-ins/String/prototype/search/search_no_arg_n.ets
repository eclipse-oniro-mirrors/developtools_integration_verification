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

// arktsid: search_no_arg_n
// description: String.prototype.search called with no argument is rejected at compile time (missing required
// StringOrRegExp argument)
// Conversion notes: test262 search() defaults the argument to undefined; ArkTS search requires exactly one argument.

/*---
desc: |
    String.prototype.search called with no argument is rejected at compile time (missing required StringOrRegExp
    argument)
tags: [compile-only, negative]
expected_out_1: |-
    Semantic error ESE0124: Expected 1 arguments, got 0.
    Semantic error ESE0127: No matching call signature for search()
---*/

function main(): void {
    let x: int = ''.search();
}
