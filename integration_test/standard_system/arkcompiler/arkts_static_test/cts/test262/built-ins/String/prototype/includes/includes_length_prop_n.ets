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

// arktsid: includes_length_prop_n
// description: Function length property (String.prototype.includes.length) is rejected at compile time (ESE0087)

/*---
desc: Function length property (String.prototype.includes.length) is rejected at compile time (ESE0087)
tags: [compile-only, negative]
expected_out_1: ["Semantic error ESE0087: Property 'length' does not exist on type 'Function'"]
---*/

function main(): void {
    let len: int = 'word'.includes.length;
}
