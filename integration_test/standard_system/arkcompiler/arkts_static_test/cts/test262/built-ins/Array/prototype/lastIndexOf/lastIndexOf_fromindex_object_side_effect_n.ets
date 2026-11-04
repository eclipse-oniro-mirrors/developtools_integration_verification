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
    lastIndexOf with an object as fromIndex whose valueOf has side effects (sets an element) is not expressible;
    ArkTS rejects the object fromIndex at compile time (fromIndex must be int), and length assignment /
    side-effecting ToNumber are unsupported
tags: [compile-only, negative]
expected_out_1: |-
    Semantic error ESE0127: No matching call signature for lastIndexOf(Object, Object)
    Semantic error ESE0046: Type 'Object' is not compatible with type 'Int|undefined' at index 2
---*/

function main(): void {
    let targetObj: Object = {};
    let fromIndex: Object = {};
    let arr: Object[] = [];
    arr.lastIndexOf(targetObj, fromIndex);
}
