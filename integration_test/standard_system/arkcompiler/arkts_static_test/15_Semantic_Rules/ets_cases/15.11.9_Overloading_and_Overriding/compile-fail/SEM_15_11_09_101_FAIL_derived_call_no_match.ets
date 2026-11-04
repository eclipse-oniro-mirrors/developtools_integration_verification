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
 * @id SEM_15_11_09_101_FAIL_derived_call_no_match
 * @expect compile-fail
 * @section 15.11.9
 * @design 派生类调用无匹配
 * @note 反向用例
 */
class Base { m(x: int): void {} }
class Derived extends Base { m(x: string): void {} }
function main(): void { let d: Derived = new Derived(); d.m(true); }
