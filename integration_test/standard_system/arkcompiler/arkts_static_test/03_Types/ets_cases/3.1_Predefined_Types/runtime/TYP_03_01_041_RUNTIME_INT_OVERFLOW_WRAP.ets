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
 * @id TYP_03_01_041_RUNTIME_INT_OVERFLOW_WRAP
 * @expect runtime
 * @section 3.1
 * @design 整数溢出静默回绕（与 Java 一致，与 Swift 不同）
 * @note 运行时用例：验证 int max+1 静默回绕为 int min（设计问题：无溢出检查）
 */
function main(): void {
  let max: int = 2147483647
  let overflow: int = max + 1

  // ArkTS/Java 静默回绕到 -2147483648
  // 这是潜在的设计安全问题
  if (overflow != -2147483648) {
    throw new Error("int overflow wrap mismatch: " + overflow)
  }

  let min: int = -2147483648
  let underflow: int = min - 1
  if (underflow != 2147483647) {
    throw new Error("int underflow wrap mismatch: " + underflow)
  }

  console.log("Int overflow silently wraps (no protection)")
}