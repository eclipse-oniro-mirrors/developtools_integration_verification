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
/*
 * @id SEM_15_08_00_114_FAIL_function_declared_base_after_call_member
 * @expect compile-fail
 * @section 15.8
 * @design Base 声明变量由 Derived 初始化后经历函数调用，不能假设仍可按 Derived 独有成员使用。
 */

class Base {}
class Derived extends Base {
  onlyDerived(): string {
    return 'derived'
  }
}

function sideEffect(): void {}

function main(): void {
  let d: Derived = new Derived()
  let b: Base = d
  sideEffect()
  b.onlyDerived()
}



