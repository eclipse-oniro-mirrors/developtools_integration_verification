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
 * @id LEX_02_05_006_PASS_KEYWORD_CONTROL_FLOW
 * @expect compile-pass
 * @section 2.5
 * @design Keywords Token: if/else/while/for 流程控制关键字
 * @note 正向用例：流程控制关键字作为 Token
 */
function testKeywordControlFlow(): void {
  let x: int = 1
  if (x > 0) {
    x = x + 1
  } else {
    x = x - 1
  }
  while (x < 10) {
    x = x + 1
  }
  for (let i: int = 0; i < 3; i = i + 1) {
    x = x + i
  }
}
