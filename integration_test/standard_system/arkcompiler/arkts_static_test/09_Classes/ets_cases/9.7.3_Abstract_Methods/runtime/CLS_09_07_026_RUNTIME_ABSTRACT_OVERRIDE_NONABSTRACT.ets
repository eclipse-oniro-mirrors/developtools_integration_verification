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
 * @id CLS_09_07_026_RUNTIME_ABSTRACT_OVERRIDE_NONABSTRACT
 * @expect runtime
 * @section 9.7.3
 * @design 抽象方法override非抽象方法运行时dispatch
 * @note 运行时用例
 */
abstract class Base26 { foo(): string { return "base" } }
class Child26 extends Base26 { override foo(): string { return "child" } }
function main(): void { let b: Base26 = new Child26(); if (b.foo() != "child") { throw new Error("bad") } console.log("verified") }
