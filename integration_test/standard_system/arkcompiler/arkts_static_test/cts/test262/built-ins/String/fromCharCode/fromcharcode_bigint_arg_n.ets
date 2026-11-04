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
// arktsid: fromcharcode_bigint_arg_n
// description: String.fromCharCode with a BigInt argument is rejected at compile time (method-arg-type)
// Conversion notes: test262 S15.5.4.4_A1_T10 (ToUint16/ToNumber) — BigInt is not compatible with Int

/*---
desc: String.fromCharCode with a BigInt argument is rejected at compile time (method-arg-type)
tags: [compile-only, negative]
expected_out_1: [
    "Semantic error ESE0127: No matching call signature for fromCharCode(bigint)",
    "Semantic error ESE0323: Type 'bigint' is not compatible with rest parameter type 'Int' at index 1",
]
---*/

function main(): void {
    String.fromCharCode(0n);
}
