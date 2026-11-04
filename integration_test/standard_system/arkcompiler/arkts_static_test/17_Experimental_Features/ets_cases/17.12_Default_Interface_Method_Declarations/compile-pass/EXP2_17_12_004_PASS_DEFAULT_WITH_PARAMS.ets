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
 * @id EXP2_17_12_004_PASS_DEFAULT_WITH_PARAMS
 * @expect compile-pass
 * @section 17.12
 * @design 默认方法声明多种参数类型（int, string, boolean）和返回值类型，类实现接口并调用
 * @note 正向用例：验证默认方法支持不同参数类型和返回值类型
 */
interface IDataFormatter {
  formatInt(value: int): string {
    return 'int:' + value
  }

  formatDouble(value: double): string {
    return 'double:' + value
  }

  formatBool(value: boolean): string {
    if (value) {
      return 'bool:true'
    } else {
      return 'bool:false'
    }
  }

  combine(a: string, b: string, sep: string): string {
    return a + sep + b
  }
}

class DataFormatter implements IDataFormatter {
}

function main(): void {
  let f: DataFormatter = new DataFormatter()
  let r1: string = f.formatInt(42)
  let r2: string = f.formatDouble(3.14)
  let r3: string = f.formatBool(true)
  let r4: string = f.combine('hello', 'world', " ")
  console.log(r1 + ' ' + r2 + ' ' + r3 + ' ' + r4)
}
