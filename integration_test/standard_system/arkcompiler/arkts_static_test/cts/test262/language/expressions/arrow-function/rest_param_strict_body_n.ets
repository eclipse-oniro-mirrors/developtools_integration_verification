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
    `"use strict"` with a rest (non-simple) parameter list is rejected (`(a, ...rest) => { "use strict"; }`), same as
    JS (test262 rest-param-strict-body.js parse-negative); note ArkTS accepts the directive with simple or default
    parameters, only rest triggers ESY0199
tags: [compile-only, negative]
expected_out_1: ["Syntax error ESY0199: Illegal 'use strict' directive in function with non-simple parameter list."]
---*/

function main(): void {
    let f = (a: int, ...rest: int[]): void => {
        'use strict';
    };
}
