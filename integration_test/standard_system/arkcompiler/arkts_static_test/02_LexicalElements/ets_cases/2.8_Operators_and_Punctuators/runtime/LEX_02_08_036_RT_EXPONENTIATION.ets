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
 * @id LEX_02_08_036_RT_EXPONENTIATION
 * @expect runtime
 * @section 2.8
 * @design 指数运算符运行时验证
 * @note runtime 用例：验证指数运算符的运行时行为
 */

function main(): void {
  // 指数运算符
  let x1 = 2 ** 3
  if (x1 !== 8) { throw new Error("2 ** 3 failed, got " + x1) }

  let x2 = 10 ** 2
  if (x2 !== 100) { throw new Error("10 ** 2 failed, got " + x2) }

  let x3 = 2 ** 10
  if (x3 !== 1024) { throw new Error("2 ** 10 failed, got " + x3) }

  let x4 = 1 ** 0
  if (x4 !== 1) { throw new Error("1 ** 0 failed, got " + x4) }

  let x5 = 0 ** 0
  if (x5 !== 1) { throw new Error("0 ** 0 failed, got " + x5) }
}
