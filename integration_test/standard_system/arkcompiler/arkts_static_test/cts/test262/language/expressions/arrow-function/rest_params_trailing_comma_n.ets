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
    A trailing comma after a rest parameter is rejected — the rest parameter must be last (`(...a,) => {}`), same as
    JS (test262 rest-params-trailing-comma-early-error.js parse-negative)
tags: [compile-only, negative]
expected_out_1: ["Syntax error ESY0067: Rest parameter must be the last formal parameter."]
---*/

function main(): void {
    let f = (...a: int[],) => a.length;
}
