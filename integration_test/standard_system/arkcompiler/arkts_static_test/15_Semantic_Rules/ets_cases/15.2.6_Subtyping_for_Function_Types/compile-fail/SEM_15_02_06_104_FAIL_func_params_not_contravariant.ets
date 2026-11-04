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
 * @id SEM_15_02_06_104_FAIL_func_params_not_contravariant
 * @expect compile-fail
 * @section 15.2.6
 * @design 参数类型需逆变：Derived 参数 → Base 参数不合法
 * @note 来自规范 15.2.6 例：bb = dd 编译错误
 */
class Base {}
class Derived extends Base {}
function main(): void {
let bb: (p: Base) => Base = (p: Base): Base => {
    return p
  };
    let dd: (p: Derived) => Derived = (p: Derived): Derived => { return p }
    bb = dd
}
