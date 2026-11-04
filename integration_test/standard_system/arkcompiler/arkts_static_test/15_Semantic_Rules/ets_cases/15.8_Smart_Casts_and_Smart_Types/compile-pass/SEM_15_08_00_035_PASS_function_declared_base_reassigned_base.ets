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
 * @id SEM_15_08_00_035_PASS_function_declared_base_reassigned_base
 * @expect compile-pass
 * @section 15.8
 * @design Base 声明变量先保存 Derived 后重新赋值为 Base，后续按 Base 使用。
 */

class Base {
  name(): string {
    return 'base'
  }
}
class Derived extends Base {}

function main(): void {
  let b: Base = new Derived()
  b = new Base()
  arktest.assertEQ(b.name(), 'base')
}



