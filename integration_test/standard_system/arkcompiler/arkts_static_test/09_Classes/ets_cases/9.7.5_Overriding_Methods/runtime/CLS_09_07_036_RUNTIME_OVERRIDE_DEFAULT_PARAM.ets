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
 * @id CLS_09_07_036_RUNTIME_OVERRIDE_DEFAULT_PARAM
 * @expect runtime
 * @section 9.7.5
 * @design Auto-added metadata
 * @note Auto-fixed missing metadata
 */
class Base36 { greet(name: string): string { return "hi " + name } }
class Child36 extends Base36 { override greet(name: string): string { return "hello " + name } }
function main(): void { let b: Base36 = new Child36(); if (b.greet("x") != "hello x") { throw new Error("fail") } console.log("verified") }
