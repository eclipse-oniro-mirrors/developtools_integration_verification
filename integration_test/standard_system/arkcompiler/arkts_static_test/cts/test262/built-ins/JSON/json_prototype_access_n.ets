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
arktsid: json_prototype_access_n
description: JSON has no prototype property — ArkTS JSON is a static utility class
tags: [compile-only, negative]
expected_out_1: |
  Semantic error ESE0087: Property 'prototype' does not exist on type 'JSON'
  Syntax error ESY30818: Runtime prototype assignment is not supported because of static typing
---*/

function main(): void {
    // test262: JSON prop-desc / prototype-related files
    // ArkTS JSON is a static utility class, no prototype
    let p = JSON.prototype;
}
