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
 * @id TYP_03_06_01_008_PASS_BIGINT_EXPLICIT_CONVERT
 * @expect compile-pass
 * @section 3.6.1
 * @design bigint 与数值类型隔离，必须用 BigInt() 显式转换
 * @note 正向用例：spec §3.6.1 BigInt 类方法显式转换
 */
function testBigintExplicitConvert(): void {
  // 从 long 显式转 bigint
  let l: long = 12345
  let big1: bigint = BigInt(l)

  // 从 string 显式转 bigint
  let big2: bigint = BigInt("12345678901234567890")

  // bigint 字面量
  let big3: bigint = 100n
}