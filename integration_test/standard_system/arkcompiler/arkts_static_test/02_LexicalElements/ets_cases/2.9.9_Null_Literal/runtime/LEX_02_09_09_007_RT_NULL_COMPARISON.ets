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
 * @id LEX_02_09_09_007_RT_NULL_COMPARISON
 * @expect runtime
 * @section 2.9.9
 * @design null 比较验证
 * @note runtime 用例：验证 null 比较的运行时行为
 */

function main(): void {
  // null 相等比较
  let x1: null = null
  let x2: null = null
  if (x1 !== x2) { throw new Error("equality failed") }

  // null 与数字比较
  let x3: int = 0
  if (x1 === x3) { throw new Error("null should not equal 0") }

  // null 与字符串比较
  let x4: string = "null"
  if (x1 === x4) { throw new Error("null should not equal \"null\"") }

  // null 与 undefined 比较
  let x5: undefined = undefined
  if (x1 === x5) { throw new Error("null should not equal undefined") }
}
