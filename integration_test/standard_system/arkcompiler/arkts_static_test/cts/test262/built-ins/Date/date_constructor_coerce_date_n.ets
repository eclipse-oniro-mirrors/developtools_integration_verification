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
desc: Date(year, month, date) with a custom object as date argument is rejected at compile time
tags: [compile-only, negative]
expected_out_1: |-
    Semantic error ESE0127: No matching construct signature for std.core.Date(Int, Int, PoisonedValueOf)
    Semantic error ESE0046: Type 'PoisonedValueOf' is not compatible with type 'Int|undefined' at index 3
---*/

class PoisonedValueOf {
    public value: int;
    constructor(val: int) {
        this.value = val;
    }
}

function main(): void {
    let d = new Date(1, 2, new PoisonedValueOf(3));
}
