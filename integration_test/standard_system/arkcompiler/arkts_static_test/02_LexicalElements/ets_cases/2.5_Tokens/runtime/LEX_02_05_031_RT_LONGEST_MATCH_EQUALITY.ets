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
 * @id LEX_02_05_031_RT_LONGEST_MATCH_EQUALITY
 * @expect runtime
 * @section 2.5
 * @design 最长匹配: === 与 == 的运行时语义差异
 * @note 运行时用例：验证 === 比 == 更严格
 */
function main(): void {
  let a: int = 5
  let b: int = 5
  if (!(a === b)) { throw new Error("a === b should be true") }
  if (!(a == b)) { throw new Error("a == b should be true") }
}
