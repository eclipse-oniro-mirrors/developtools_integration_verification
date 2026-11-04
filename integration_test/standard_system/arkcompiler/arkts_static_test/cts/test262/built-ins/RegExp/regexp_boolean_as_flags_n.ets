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
arktsid: regexp_boolean_as_flags_n
description: new RegExp("|", true) is rejected at compile time — Boolean is not String|undefined
tags: [compile-only, negative]
expected_out_1: |
  Semantic error ESE0127: No matching construct signature for std.core.RegExp("|", Boolean)
  Semantic error ESE0046: Type 'Boolean' is not compatible with type 'String|undefined' at index 2
---*/

function main(): void {
    new RegExp('|', true)
}
