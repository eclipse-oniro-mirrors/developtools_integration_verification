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
// arktsid: padend_symbol_fillstring_n
// description: String#padEnd with a Symbol fillString is rejected at compile time
// Conversion notes: test262 ToString(fillString) throws TypeError on a Symbol; ArkTS has no Symbol type

/*---
desc: String#padEnd with a Symbol fillString is rejected at compile time
tags: [compile-only, negative]
expected_out_1: ["Semantic error ESE0143: Unresolved reference Symbol"]
---*/

function main(): void {
    let s: string = 'abc'.padEnd(10, Symbol());
}
