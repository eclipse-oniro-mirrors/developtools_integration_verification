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
// arktsid: string_trim_end_this_value_not_obj_coercible_n
// description: String.prototype.trimEnd requires an object-coercible this value - .call(undefined/null) is
// rejected at compile time
// description: String.prototype.trimEnd requires an object-coercible this value - .call(undefined/null) is
// rejected at compile time
// Conversion notes: JS relies on Function.prototype.call + dynamic this, both unavailable in ArkTS (compile-time
// rejection)
// Conversion notes: JS relies on Function.prototype.call + dynamic this, both unavailable in ArkTS (compile-time
// rejection)

/*---
desc: 'String.prototype.trimEnd with undefined/null this is rejected at compile time (.call unavailable)'
tags: [compile-only, negative]
expected_out_1: ["Semantic error ESE0087: Property 'call' does not exist on type 'Function'"]
---*/

function main(): void {
    let trimEnd: (str: string) => string = (str: string): string => str.trimEnd();
    trimEnd.call(undefined);
    trimEnd.call(null);
}
