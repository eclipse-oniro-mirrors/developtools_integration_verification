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
 * @id SEM_15_08_00_112_FAIL_top_level_declared_base_init_derived_member
 * @expect compile-fail
 * @section 15.8
 * @design 顶层 Base 声明变量用 Derived 初始化，未显式缩窄不应访问 Derived 独有成员。
 */

class Base {}
class Derived extends Base {
  onlyDerived(): string {
    return 'derived'
  }
}

let b: Base = new Derived()
let s: string = b.onlyDerived()

function main(): void {}



