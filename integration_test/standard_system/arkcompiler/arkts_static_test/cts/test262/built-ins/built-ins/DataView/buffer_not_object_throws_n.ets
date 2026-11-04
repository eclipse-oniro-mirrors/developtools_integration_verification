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
desc: DataView constructor requires an ArrayBuffer buffer; primitive buffer values are rejected at compile time
tags: [compile-only, negative]
expected_out_1: |-
    Semantic error ESE0127: No matching construct signature for std.core.DataView(Int)
    Semantic error ESE0046: Type 'Int' is not compatible with type 'ArrayBuffer' at index 1
    Semantic error ESE0127: No matching construct signature for std.core.DataView("buffer")
    Semantic error ESE0046: Type '"buffer"' is not compatible with type 'ArrayBuffer' at index 1
    Semantic error ESE0127: No matching construct signature for std.core.DataView(Boolean)
    Semantic error ESE0046: Type 'Boolean' is not compatible with type 'ArrayBuffer' at index 1
---*/

function main(): void {
    let dv1 = new DataView(0);        // number buffer
    let dv2 = new DataView('buffer'); // string buffer
    let dv3 = new DataView(true);     // boolean buffer
}
