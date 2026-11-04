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
 * @id LEX_02_09_02_030_RT_TYPE_CONVERSION
 * @expect runtime
 * @section 2.9.2
 * @design 更多类型转换运行时验证
 * @note runtime 用例：验证更多类型转换的运行时行为
 */

function main(): void {
  // int -> long 隐式转换
  let x1: int = 42
  let x2: long = x1
  if (x2 !== 42) { throw new Error("int to long failed, got " + x2) }

  // long -> int 显式转换
  let x3: long = 42
  let x4: int = Long.toInt(x3)
  if (x4 !== 42) { throw new Error("long to int failed, got " + x4) }

  // long -> int 溢出转换
  let x5: long = 2147483648
  let x6: int = Long.toInt(x5)
  if (x6 !== -2147483648) { throw new Error("long to int overflow failed, got " + x6) }

  // 负数转换
  let x7: long = -42
  let x8: int = Long.toInt(x7)
  if (x8 !== -42) { throw new Error("negative long to int failed, got " + x8) }
}
