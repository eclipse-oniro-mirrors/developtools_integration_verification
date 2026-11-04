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
 * @id SEM_15_08_00_115_FAIL_SMART_GLOBAL_global_base_member_without_narrow
 * @expect compile-fail
 * @section 15.8
 * @design 顶层/全局 Base 声明变量即使初始化为 Derived，未显式缩窄也不应访问 Derived 独有成员。
 * @note Cross-cutting smart type scope case: global/function-scope behavior per section.
 */

class SmartBase {}
class SmartDerived extends SmartBase {
  onlyDerived(): string {
    return 'derived'
  }
}

let globalBase: SmartBase = new SmartDerived()
let globalText: string = globalBase.onlyDerived()

function main(): void {}



