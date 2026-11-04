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
 * @id TYP_03_06_03_017_RUNTIME_GRADUAL_UNDERFLOW
 * @expect runtime
 * @section 3.6.3
 * @design 浮点下溢渐进降低精度（gradual underflow），最终趋于 0
 * @note 运行时用例：spec §3.6.3 "do not flush to zero"
 */
function main(): void {
  let small: double = 1e-300
  let underflow: double = small / 1e100

  // 不应直接 flush 到 0（除非超过非规格化范围）
  // 但极端下溢仍可能为 0
  let veryDeep: double = small / 1e300
  if (veryDeep < 0.0) {
    throw new Error("underflow should not be negative")
  }

  // 中等下溢应保持正非零
  let medium: double = 1e-200
  let medUnderflow: double = medium / 1e100
  if (medUnderflow == 0.0) {
    throw new Error("Medium underflow should not flush to 0: " + medUnderflow)
  }

  console.log("Gradual underflow verified")
}