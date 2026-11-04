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
    new Function() is rejected at compile time — Function is an interface, not constructable; ArkTS 1.2 has no
    dynamic code evaluation
tags: [compile-only, negative]
expected_out_1: ["Semantic error ESE0275: Function is an interface therefore cannot be instantiated."]
---*/

function main(): void {
    let f = new Function('return 42');
}
