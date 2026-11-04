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
 * @id LEX_02_09_02_023_RT_INT_OVERFLOW
 * @expect runtime
 * @section 2.9.2
 * @design 整数溢出检测验证
 * @note runtime 用例：验证整数溢出行为
 */

function main(): void {
  // 验证 int 溢出行为
  let x1: int = 2147483647  // max(int)
  let x2: int = x1 + 1
  // 溢出到 min(int)
  if (x2 !== -2147483648) { throw new Error("int overflow failed, got " + x2) }

  // 验证 int 负溢出行为
  let x3: int = -2147483648  // min(int)
  let x4: int = x3 - 1
  // 溢出到 max(int)
  if (x4 !== 2147483647) { throw new Error("int underflow failed, got " + x4) }

  // 验证 int 乘法溢出
  let x5: int = 46341  // sqrt(max(int))
  let x6: int = x5 * x5
  // 46341 * 46341 = 2147488281, overflow to -2147479015
  if (x6 !== -2147479015) { throw new Error("int multiplication overflow failed, got " + x6) }
}
