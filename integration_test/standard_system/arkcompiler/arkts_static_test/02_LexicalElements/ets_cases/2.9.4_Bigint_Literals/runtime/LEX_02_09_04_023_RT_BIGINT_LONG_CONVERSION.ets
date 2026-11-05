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
 * @id LEX_02_09_04_023_RT_BIGINT_LONG_CONVERSION
 * @expect runtime
 * @section 2.9.4
 * @design bigint 与 long 转换运行时验证
 * @note runtime 用例：验证 bigint 与 long 转换的运行时行为
 */

function main(): void {
  // long -> bigint 隐式转换
  let x1: long = 42
  let x2: bigint = x1 as bigint
  if (x2 !== 42n) { throw new Error("long to bigint failed, got " + x2) }

  // int -> bigint 隐式转换
  let x3: int = 100
  let x4: bigint = x3 as bigint
  if (x4 !== 100n) { throw new Error("int to bigint failed, got " + x4) }

  // bigint 转 long
  let x5: bigint = 42n
  let x6: long = Long.toInt(x5)
  if (x6 !== 42) { throw new Error("bigint to long failed, got " + x6) }
}

