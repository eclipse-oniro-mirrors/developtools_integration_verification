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
 * @id EXP_07_35_01_007_PASS_MULTI_PARAM_INFERRED
 * @expect compile-pass
 * @section 7.35.1
 * @design 验证多参数 Lambda 的类型从目标类型上下文推断，参数名与目标类型参数名可以不同
 * @note 正向用例：验证多参数从上下文推断的正确用法（参数名由开发者命名，类型由上下文决定）
 */
function main(): void {
  // 从目标类型推断多参数类型
  const add: (a: int, b: int) => int = (x, y) => x + y
  const mult: (a: double, b: double) => double = (x, y) => x * y

  // 混合类型推断（字符串拼接）
  const strCat: (s: string, n: int) => string = (str, num) => str + num

  // 三个参数推断
  const sum3: (a: int, b: int, c: int) => int = (x, y, z) => x + y + z

  // 验证实际调用值正确
  let r1: int = add(10, 20)
  let r2: double = mult(3.0, 4.0)
  let r3: string = strCat('value: ', 99)
  let r4: int = sum3(1, 2, 3)

  if (r1 != 30) {
    throw new Error('FAIL: add')
  }
  if (r2 != 12.0) {
    throw new Error('FAIL: mult')
  }
  if (r3 != 'value: 99') {
    throw new Error('FAIL: strCat')
  }
  if (r4 != 6) {
    throw new Error('FAIL: sum3')
  }
console.log('verified')
}
