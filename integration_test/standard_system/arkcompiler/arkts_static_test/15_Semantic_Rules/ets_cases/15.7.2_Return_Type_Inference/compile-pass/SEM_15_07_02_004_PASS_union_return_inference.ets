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
 * @id SEM_15_07_02_004_PASS_union_return_inference
 * @expect compile-pass
 * @section 15.7.2
 * @design 规范 15.7.2：多return语句推断联合返回类型
 * @note 正向用例：bar返回Derived1|Derived2联合类型
 */
class Base {}
class Derived1 extends Base {}
class Derived2 extends Base {}
function bar(condition: boolean): Base {
    if (condition) {
    return new Derived1();
  } else {
    return new Derived2();
  }
function main(): void {
    let r: Base = bar(true);
    console.log('verified');
}
