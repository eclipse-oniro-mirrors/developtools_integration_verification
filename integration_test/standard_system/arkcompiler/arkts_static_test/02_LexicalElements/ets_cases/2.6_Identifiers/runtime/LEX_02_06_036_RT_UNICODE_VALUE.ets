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
 * @id LEX_02_06_036_RT_UNICODE_VALUE
 * @expect runtime
 * @section 2.6
 * @design 运行时验证 Unicode 标识符值访问正确
 * @note 运行时用例：中文/日文标识符运行时
 */
function main(): void {
  let 计数器: int = 0
  let カウンタ: int = 10
  计数器 = 计数器 + 5
  カウンタ = カウンタ + 计数器
  if (计数器 !== 5) { throw new Error("counter !== 5") }
  if (カウンタ !== 15) { throw new Error("counter jp !== 15") }
}
