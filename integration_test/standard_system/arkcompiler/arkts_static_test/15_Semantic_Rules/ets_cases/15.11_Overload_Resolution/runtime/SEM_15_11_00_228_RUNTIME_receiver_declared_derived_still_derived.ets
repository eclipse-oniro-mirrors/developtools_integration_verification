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
 * @id SEM_15_11_00_228_RUNTIME_receiver_declared_derived_still_derived
 * @expect runtime
 * @section 15.11
 * @design receiver 声明类型为 Derived 时调用 overload，应选择 Derived overload set。
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

function main(): void {
  let d: Derived = new Derived()
  arktest.assertEQ(d.pick(9), 'derived-int')
}



