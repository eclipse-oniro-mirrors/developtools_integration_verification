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
 * @id TYP_03_06_01_017_RUNTIME_WIDENING_VALUE_PRESERVED
 * @expect runtime
 * @section 3.6.1
 * @design widening 转换值正确保留
 * @note 运行时用例：byte→long、int→double 后值保持
 */
function main(): void {
  let b: byte = 100
  let l: long = b
  if (l != 100) {
    throw new Error("byte to long widening lost value")
  }

  let i: int = 1234567
  let d: double = i
  if (d != 1234567.0) {
    throw new Error("int to double widening lost value")
  }

  let s: short = 30000
  let f: float = s
  if (f != 30000.0f) {
    throw new Error("short to float widening lost value")
  }

  // 大数值 long→double 可能精度损失，但应在合理范围
  let bigL: long = 9007199254740993  // 2^53 + 1
  let asD: double = bigL
  // 由于 double 仅 53 位精度，超过 2^53 的奇数会被舍入
  // 这里只验证 widening 编译通过和近似正确
  if (asD < 9007199254740990.0 || asD > 9007199254740994.0) {
    throw new Error("long to double range error")
  }

  console.log("Widening preserve verified")
}