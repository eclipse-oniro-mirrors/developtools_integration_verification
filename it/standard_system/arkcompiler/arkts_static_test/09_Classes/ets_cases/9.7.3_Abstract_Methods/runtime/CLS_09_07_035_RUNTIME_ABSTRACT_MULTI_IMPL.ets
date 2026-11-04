/*
* Copyright (c) 2021-2026 Huawei Device Co., Ltd.
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

/**
 * @id CLS_09_07_035_RUNTIME_ABSTRACT_MULTI_IMPL
 * @expect runtime
 * @section 9.7.3
 * @design Auto-added metadata
 * @note Auto-fixed missing metadata
 */
abstract class Shape { abstract area(): int }
class Square extends Shape { override area(): int { return 4 } }
class Rect extends Shape { override area(): int { return 6 } }
function main(): void { let s1: Shape = new Square(); let s2: Shape = new Rect(); if (s1.area()!=4 || s2.area()!=6) { throw new Error("fail") } console.log("verified") }
