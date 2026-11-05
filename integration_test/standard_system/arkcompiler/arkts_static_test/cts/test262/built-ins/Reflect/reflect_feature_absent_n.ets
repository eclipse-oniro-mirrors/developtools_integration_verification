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
arktsid: reflect_feature_absent_n
description: JS Reflect methods do not exist in ArkTS
tags: [compile-only, negative]
expected_out_1: |
  Semantic error ESE0143: Unresolved reference Reflect
---*/

function main(): void {
    let p = Reflect.getPrototypeOf({} as Object);
}
