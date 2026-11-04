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
arktsid: re_proto_exec_S15_10_6_2_A4_T2_n
description: |
    RegExp lastIndex cannot be assigned undefined — lastIndex is an int field in ArkTS, so JS ToInteger coercion of
    undefined is rejected at compile time
tags: [compile-only, negative]
expected_out_1: |
  Semantic error ESE0318: Type 'undefined' cannot be assigned to type 'Int'
---*/

function main(): void {
    let re: RegExp = new RegExp('(?:ab|cd)\\d?', 'g');
    re.lastIndex = undefined;
}
