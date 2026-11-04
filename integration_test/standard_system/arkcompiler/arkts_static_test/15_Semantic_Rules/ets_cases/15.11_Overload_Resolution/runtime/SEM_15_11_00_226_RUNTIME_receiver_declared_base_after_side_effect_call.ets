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
 * @id SEM_15_11_00_226_RUNTIME_receiver_declared_base_after_side_effect_call
 * @expect runtime
 * @section 15.11
 * @design Base 局部变量由 Derived 初始化后经历普通函数调用，调用 overload 仍应基于声明类型。
 */

class Base {
  overload pick { pickNumber, pickString }
  pickNumber(p: number): string { return 'base-number' }
  pickString(p: string): string { return 'base-string' }
}
class Derived extends Base {
  pickInt(p: int): string { return 'derived-int' }
  overload pick { pickInt, pickNumber, pickString }
}

function sideEffect(): void {}

function main(): void {
  let b: Base = new Derived()
  sideEffect()
  arktest.assertEQ(b.pick(9), 'base-number')
}



