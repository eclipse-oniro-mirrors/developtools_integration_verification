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
 * @id EXP_07_24_001_PASS_BYTE_SHORT_PROMOTION
 * @expect compile-pass
 * @section 7.24
 * @design 验证 byte/short 类型在幂运算中提升为 double（number 类型）：
 *         byte**byte→number, short**short→number, byte**short→number, short**byte→number
 * @note 正向用例：验证 byte/short 到 double 的隐式提升
 */
function main(): void {
  let a: byte = 2
  let b: byte = 3
  let c: short = 4
  let d: short = 2
  let e: number = a ** b  // byte**byte→number
  let f: number = c ** d  // short**short→number
  let g: number = a ** c  // byte**short→number
  let h: number = c ** b  // short**byte→number
  console.log('verified')
}
