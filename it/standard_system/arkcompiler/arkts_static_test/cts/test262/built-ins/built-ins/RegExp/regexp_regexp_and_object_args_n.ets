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
arktsid: regexp_regexp_and_object_args_n
description: new RegExp(re, obj) is rejected — Object is not assignable to String|undefined
tags: [compile-only, negative]
expected_out_1: |
  Semantic error ESE0127: No matching construct signature for std.core.RegExp(RegExp, Object)
---*/

function main(): void {
    let re: RegExp = new RegExp('1?1', 'mig');
    let obj: Object = {};
    let r = new RegExp(re, obj)
}
