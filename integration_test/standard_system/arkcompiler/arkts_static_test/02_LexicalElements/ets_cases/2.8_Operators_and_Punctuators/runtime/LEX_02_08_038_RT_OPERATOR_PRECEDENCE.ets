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
 * @id LEX_02_08_038_RT_OPERATOR_PRECEDENCE
 * @expect runtime
 * @section 2.8
 * @design 运算符优先级运行时验证
 * @note runtime 用例：验证运算符优先级的运行时行为
 */

function main(): void {
  // 乘法优先于加法
  let x1 = 2 + 3 * 4
  if (x1 !== 14) { throw new Error("2 + 3 * 4 failed, got " + x1) }

  // 指数优先于乘法
  let x2 = 2 * 3 ** 2
  if (x2 !== 18) { throw new Error("2 * 3 ** 2 failed, got " + x2) }

  // 逻辑与优先于逻辑或
  let x3 = true || false && false
  if (x3 !== true) { throw new Error("true || false && false failed, got " + x3) }

  // 括号改变优先级
  let x4 = (2 + 3) * 4
  if (x4 !== 20) { throw new Error("(2 + 3) * 4 failed, got " + x4) }
}
