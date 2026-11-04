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
 * @id SEM_15_10_00_104_FAIL_static_method_not_inherited_by_subclass_name
 * @expect compile-fail
 * @section 15.10
 * @design static 方法不应作为继承成员参与子类名访问；Derived.select(26) 不应解析到 Base.select(int)。
 * @note Report notes current implementation may differ from spec here.
 */

class Base {
  static select(p: int): string {
    return 'base-int'
  }
}

class Derived extends Base {
  static selectString(p: string): string {
    return 'derived-string'
  }
}

function main(): void {
  let value: string = Derived.select(26)
}



