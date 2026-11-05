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
desc: Temporal.Instant is not supported in ArkTS 1.2
tags: [compile-only, negative]
expected_out_1: [
    "Semantic error ESE0371: Cannot find type 'Temporal'.",
    "Semantic error ESE0070: 'Instant' type does not exist.",
]
---*/

function main(): void {
    let inst = new Temporal.Instant(0n);;
}
