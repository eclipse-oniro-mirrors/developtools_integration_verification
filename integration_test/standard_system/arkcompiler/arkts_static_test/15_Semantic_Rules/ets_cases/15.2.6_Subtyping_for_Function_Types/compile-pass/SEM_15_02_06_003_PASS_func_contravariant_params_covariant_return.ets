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
 * @id SEM_15_02_06_003_PASS_func_contravariant_params_covariant_return
 * @expect compile-pass
 * @section 15.2.6
 * @design 参数逆变且返回值协变：(p:Base)=>Derived <: (p:Derived)=>Base
 * @note 来自规范 15.2.6 例：db = bd OK
 */
class Base {}
class Derived extends Base {}
function main(): void {
let db: (p: Derived) => Base = (p: Derived): Base => {
    return p
  };
    let bd: (p: Base) => Derived = (p: Base): Derived => { return p as Derived }
    db = bd
}
