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
 * @id LEX_02_04_041_RT_TRY_CATCH_LINE_SEP
 * @expect runtime
 * @section 2.4
 * @design try-catch 内换行运行时验证
 * @note runtime 用例：验证 try-catch 语句中的换行符不影响程序行为
 */

function test1(): int {
  try {
    let x = 1
    let y = 2
    return x + y
  } catch (e) {
    return -1
  } finally {
    // finally block
  }
}

function test2(): int {
  try {
    let x = 10
    return x
  } catch (e) {
    return -1
  }
}

function main(): void {
  // try-catch 内换行
  let result1 = test1()
  if (result1 !== 3) { throw new Error("test1 failed, got " + result1) }

  let result2 = test2()
  if (result2 !== 10) { throw new Error("test2 failed, got " + result2) }
}
