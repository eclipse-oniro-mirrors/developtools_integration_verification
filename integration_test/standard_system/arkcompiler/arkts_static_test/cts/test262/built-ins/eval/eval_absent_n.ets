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
    eval is absent in ArkTS - a bare eval reference is unresolved at compile time. Covers test262 built-ins/eval (10
    files: length/name/prop-desc/no-construct/no-proto/not-a-constructor/private-identifiers) which all test eval
    function-object properties or eval behavior, all blocked by eval being unavailable.
tags: [compile-only, negative]
expected_out_1: ["Semantic error ESE0143: Unresolved reference eval"]
---*/

function main(): void {
    let x = eval('1 + 1');
}
