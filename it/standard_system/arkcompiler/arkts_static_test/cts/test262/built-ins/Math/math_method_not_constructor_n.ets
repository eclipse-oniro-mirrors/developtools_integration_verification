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
arktsid: math_method_not_constructor_n
description: Math static methods cannot be used with new — representative negative
tags: [compile-only, negative]
expected_out_1: |
  Semantic error ESE0070: 'abs' type does not exist.
---*/

function main(): void {
    // test262: 36 not-a-constructor.js in Math/*
    // All Math methods (abs, cos, sin, etc.) are static, not constructable
    let x = new Math.abs(-5);
}
