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
 * @id LEX_02_09_02_019_RT_ARITHMETIC
 * @expect runtime
 * @section 2.9.2
 * @design 整数运算验证
 * @note runtime 用例：验证整数运算正确性
 */

function main(): void {
  // 验证整数运算
  let a: int = 100
  let b: int = 200
  let sum: int = a + b

  if (sum !== 300) { throw new Error("addition mismatch") }

  // 验证 long 运算
  let big1: long = 2147483648
  let big2: long = 2147483648
  let bigSum: long = big1 + big2

  if (bigSum !== 4294967296) { throw new Error("long addition mismatch") }
}
