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
 * @id LEX_02_06_049_RT_CASE_SENSITIVITY
 * @expect runtime
 * @section 2.6
 * @design 标识符大小写敏感运行时验证
 * @note runtime 用例：验证标识符大小写敏感的运行时行为
 */

function main(): void {
  // 大小写敏感的标识符
  let myVar = 1
  let MyVar = 2
  let MYVAR = 3
  let myvar = 4

  if (myVar !== 1) { throw new Error("myVar failed, got " + myVar) }
  if (MyVar !== 2) { throw new Error("MyVar failed, got " + MyVar) }
  if (MYVAR !== 3) { throw new Error("MYVAR failed, got " + MYVAR) }
  if (myvar !== 4) { throw new Error("myvar failed, got " + myvar) }

  // 验证它们是不同的变量
  let sum = myVar + MyVar + MYVAR + myvar
  if (sum !== 10) { throw new Error("sum failed, got " + sum) }
}
