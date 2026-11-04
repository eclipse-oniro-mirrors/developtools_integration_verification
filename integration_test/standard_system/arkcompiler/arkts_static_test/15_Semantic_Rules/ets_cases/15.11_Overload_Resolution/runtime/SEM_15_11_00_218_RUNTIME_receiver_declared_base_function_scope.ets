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
 * @id SEM_15_11_00_218_RUNTIME_receiver_declared_base_function_scope
 * @expect runtime
 * @section 15.11
 * @design 函数体内：子类对象赋给父类声明变量后调用 overload，应按 receiver 声明静态类型 Base 的 overload set 解析。
 * @note Regression case from ArkTS_Overload_Java_Swift_Comparison_Report.md.
 */

class Base {
  overload pick { pickNumber, pickString }

  pickNumber(p: number): string {
    return 'base-number'
  }

  pickString(p: string): string {
    return 'base-string'
  }
}

class Derived extends Base {
  pickInt(p: int): string {
    return 'derived-int'
  }

  overload pick { pickInt, pickNumber, pickString }
}

function main(): void {
  let d: Derived = new Derived()
  let b: Base = d

  arktest.assertEQ(d.pick(9), 'derived-int')
  arktest.assertEQ(b.pick(9), 'base-number')
}



