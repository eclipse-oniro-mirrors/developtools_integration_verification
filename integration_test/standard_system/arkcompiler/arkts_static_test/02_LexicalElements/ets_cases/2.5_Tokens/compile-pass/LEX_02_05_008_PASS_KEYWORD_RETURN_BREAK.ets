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
 * @id LEX_02_05_008_PASS_KEYWORD_RETURN_BREAK
 * @expect compile-pass
 * @section 2.5
 * @design Keywords Token: return/break/continue 关键字
 * @note 正向用例：跳转关键字作为 Token
 */
function getValue(): int {
  return 42
}

function testKeywordReturnBreak(): void {
  let sum: int = 0
  for (let i: int = 0; i < 10; i = i + 1) {
    if (i === 5) {
      break
    }
    if (i % 2 === 0) {
      continue
    }
    sum = sum + i
  }
  let v: int = getValue()
}
