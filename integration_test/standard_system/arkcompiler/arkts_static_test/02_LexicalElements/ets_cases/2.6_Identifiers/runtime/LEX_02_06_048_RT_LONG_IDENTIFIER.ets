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
 * @id LEX_02_06_048_RT_LONG_IDENTIFIER
 * @expect runtime
 * @section 2.6
 * @design 长标识符运行时验证
 * @note runtime 用例：验证长标识符的运行时行为
 */

function main(): void {
  // 长标识符
  let veryLongIdentifierNameThatIsUsedForTestingPurposesOnly = 1
  if (veryLongIdentifierNameThatIsUsedForTestingPurposesOnly !== 1) {
    throw new Error("long identifier failed")
  }

  let a123456789012345678901234567890 = 2
  if (a123456789012345678901234567890 !== 2) {
    throw new Error("numeric suffix identifier failed")
  }
}
