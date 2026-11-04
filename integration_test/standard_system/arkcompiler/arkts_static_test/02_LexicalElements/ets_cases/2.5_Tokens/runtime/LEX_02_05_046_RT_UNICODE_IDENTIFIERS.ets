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
 * @id LEX_02_05_046_RT_UNICODE_IDENTIFIERS
 * @expect runtime
 * @section 2.5
 * @design Unicode 标识符运行时验证
 * @note runtime 用例：验证 Unicode 标识符的运行时行为
 */

function main(): void {
  // Unicode 标识符
  let 变量1 = 100
  if (变量1 !== 100) { throw new Error("变量1 failed, got " + 变量1) }

  let 名字 = "Alice"
  if (名字 !== "Alice") { throw new Error("名字 failed, got " + 名字) }

  let π = 3.14
  if (π < 3.13 || π > 3.15) { throw new Error("π failed, got " + π) }
}
