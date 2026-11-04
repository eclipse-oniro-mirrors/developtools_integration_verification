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
arktsid: target_null_n
description: |
    Object.assign target is null should throw TypeError, in ArkTS null is not assignable to the non-null Record
    target so it fails at compile time
tags: [compile-only, negative]
expected_out_1: |-
  Semantic error ESE0127: No matching call signature for assign(null, ...)
  Semantic error ESE0046: Type 'null' is not compatible with type 'Record<String,Any>' at index 1
  Semantic error ESE0062: need to specify target type for class composite
---*/

function main(): void {
    Object.assign(null, { a: 1 });
}
