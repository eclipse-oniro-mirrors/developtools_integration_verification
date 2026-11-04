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
 * @id LEX_02_08_037_RT_ARROW_FUNCTION
 * @expect runtime
 * @section 2.8
 * @design 箭头函数运行时验证
 * @note runtime 用例：验证箭头函数的运行时行为
 */

function main(): void {
  // 箭头函数
  let add = (a: int, b: int): int => a + b
  let result1 = add(1, 2)
  if (result1 !== 3) { throw new Error("add failed, got " + result1) }

  let square = (x: int): int => x * x
  let result2 = square(5)
  if (result2 !== 25) { throw new Error("square failed, got " + result2) }

  // 多行箭头函数
  let complex = (x: int, y: int): int => {
    let sum = x + y
    return sum * 2
  }
  let result3 = complex(3, 4)
  if (result3 !== 14) { throw new Error("complex failed, got " + result3) }
}
