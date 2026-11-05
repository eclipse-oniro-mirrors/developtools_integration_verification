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
    Array.prototype.copyWithin returns abrupt from ToInteger(target) - passing an object (valueOf throws) is
    rejected at compile time in ArkTS
tags: [compile-only, negative]
expected_out_1: |-
    Semantic error ESE0124: Expected 2 arguments, got 1.
    Semantic error ESE0127: No matching call signature for copyWithin(Object)
---*/

function main(): void {
    let a: int[] = [];
    let o1: Object = {};
    a.copyWithin(o1);
}
