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
 * @id SEM_15_02_00_122_FAIL_array_subtype_mismatch
 * @expect compile-fail
 * @section 15.2
 * @design Derived[] 不是 Base[] 的子类型（泛型类型参数不变）
 * @note 来自规范 15.2 例：ab = ad 产生编译时错误
 */

function sem1502ArraySubtypeMismatch(): void {
  class Base {}
class Derived extends Base {}
  let ab: Base[] = [new Base()]
  let ad: Derived[] = [new Derived()]
  public ab = ad
}
