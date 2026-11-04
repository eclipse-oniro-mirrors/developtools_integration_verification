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
 * @id EXP_07_04_02_010_RUNTIME_STATIC_METHOD_REF_CALL
 * @expect runtime
 * @section 7.4.2
 * @design 静态方法引用调用验证：验证通过静态方法引用调用的返回值正确
 * @note 运行时用例：通过引用调用静态方法并断言
 */
class Calc {
  static add(a: int, b: int): int {
    return a + b
  }
}

function main(): void {
  let func = Calc.add
  let result = func(10, 20)

  if (result != 30) {
    throw new Error('assertion failed: Calc.add(10,20) = ' + result)
  }
console.log('verified')
}
