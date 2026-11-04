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
// arktsid: string_trim_end_this_value_symbol_typeerror_n
// description: String.prototype.trimEnd with a Symbol this value - ToString(Symbol) throws, ArkTS rejects at compile
// time
// Conversion notes: Symbol unavailable in ArkTS; .call unavailable (compile-time)

/*---
desc: 'String.prototype.trimEnd with a Symbol this value is rejected at compile time (.call and Symbol unavailable)'
tags: [compile-only, negative]
expected_out_1: ["Semantic error ESE0087: Property 'call' does not exist on type 'Function'"]
---*/

function main(): void {
    let trimEnd: (str: string) => string = (str: string): string => str.trimEnd();
    trimEnd.call(Symbol());
}
