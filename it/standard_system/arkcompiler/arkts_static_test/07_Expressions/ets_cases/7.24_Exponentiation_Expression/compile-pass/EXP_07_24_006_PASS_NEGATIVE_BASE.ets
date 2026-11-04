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
 * @id EXP_07_24_006_PASS_NEGATIVE_BASE
 * @expect compile-pass
 * @section 7.24
 * @design 验证负数基底幂运算编译通过：包含 double 负数基和 bigint 负数基
 * @note 正向用例：负数操作数幂运算
 */
function main(): void {
  let a: double = -2.0
  let b: double = 3.0
  let c: double = a ** b   // (-2.0)**3.0=-8.0
  let d: bigint = (-3n) ** 2n  // 9n
  let e: bigint = (-5n) ** 3n  // -125n
  console.log('verified')
}
