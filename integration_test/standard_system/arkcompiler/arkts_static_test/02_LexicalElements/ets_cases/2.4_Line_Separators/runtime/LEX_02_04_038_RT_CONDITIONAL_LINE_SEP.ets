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
 * @id LEX_02_04_038_RT_CONDITIONAL_LINE_SEP
 * @expect runtime
 * @section 2.4
 * @design 条件表达式内换行运行时验证
 * @note runtime 用例：验证条件表达式中的换行符不影响程序行为
 */

function main(): void {
  // if 语句内换行
  let x: int = 10
  let result1: int = 0

  if (x > 5) {
    result1 = x + 1
  }

  if (result1 !== 11) { throw new Error("if failed, got " + result1) }

  // if-else 语句内换行
  let result2: int = 0

  if (x > 5) {
    result2 = x + 1
  } else {
    result2 = x - 1
  }

  if (result2 !== 11) { throw new Error("if-else failed, got " + result2) }

  // 三元表达式内换行
  let z = (x > 5)
    ? x + 1
    : x - 1

  if (z !== 11) { throw new Error("ternary failed, got " + z) }
}
