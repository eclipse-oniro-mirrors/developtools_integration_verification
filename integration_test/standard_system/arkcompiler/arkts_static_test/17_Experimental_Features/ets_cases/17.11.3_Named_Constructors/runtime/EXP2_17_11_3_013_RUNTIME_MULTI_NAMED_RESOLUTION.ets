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
 * @id EXP2_17_11_3_013_RUNTIME_MULTI_NAMED_RESOLUTION
 * @expect runtime
 * @section 17.11.3
 * @design 多个命名构造函数重载解析验证：验证编译器根据参数类型选择正确的命名构造函数
 * @note 运行时用例：验证 int/double/string 参数分别匹配不同的命名构造函数
 */
class Converter {
  public result: double

  constructor FromInt(n: int) {
    this.result = n
  }
  constructor FromDouble(d: double) {
    this.result = d * 2
  }
  constructor FromString(s: string) {
    this.result = 100
  }
  overload constructor { FromInt, FromDouble, FromString }
}

function main(): void {
  let c1: Converter = new Converter(5)
  if (c1.result != 5) {
    throw new Error('assertion failed: FromInt should set result to 5')
  }

  let c2: Converter = new Converter(3.5)
  if (c2.result != 7) {
    throw new Error('assertion failed: FromDouble should set result to 7')
  }

  let c3: Converter = new Converter('test')
  if (c3.result != 100) {
    throw new Error('assertion failed: FromString should set result to 100')
  }

  console.log('verified')
}
