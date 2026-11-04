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
 * @id SEM_15_08_00_034_PASS_function_declared_base_instanceof_member
 * @expect compile-pass
 * @section 15.8
 * @design Base 声明变量经过 instanceof Derived 显式缩窄后可访问 Derived 独有成员。
 */

class Base {}
class Derived extends Base {
  onlyDerived(): string {
    return 'derived'
  }
}

function main(): void {
  let b: Base = new Derived()
  if (b instanceof Derived) {
    let s: string = b.onlyDerived()
}
}



