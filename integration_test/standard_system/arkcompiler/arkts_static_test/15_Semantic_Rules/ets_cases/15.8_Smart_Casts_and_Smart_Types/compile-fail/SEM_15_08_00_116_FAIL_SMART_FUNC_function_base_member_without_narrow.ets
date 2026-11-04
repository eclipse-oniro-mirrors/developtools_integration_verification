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
 * @id SEM_15_08_00_116_FAIL_SMART_FUNC_function_base_member_without_narrow
 * @expect compile-fail
 * @section 15.8
 * @design 鍑芥暟浣撳唴 Base 澹版槑鍙橀噺鍗充娇鍒濆鍖栦负 Derived锛屾湭鏄惧紡缂╃獎涔熶笉搴旇闂?Derived 鐙湁鎴愬憳銆?
 * @note Cross-cutting smart type scope case: global/function-scope behavior per section.
 */

class SmartBase {}
class SmartDerived extends SmartBase {
  onlyDerived(): string {
    return 'derived'
  }
}

function main(): void {
  let localBase: SmartBase = new SmartDerived()
  let text: string = localBase.onlyDerived()
}



