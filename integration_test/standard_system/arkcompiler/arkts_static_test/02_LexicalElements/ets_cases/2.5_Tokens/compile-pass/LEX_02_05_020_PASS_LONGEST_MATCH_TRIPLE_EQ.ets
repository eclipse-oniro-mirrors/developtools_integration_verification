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
 * @id LEX_02_05_020_PASS_LONGEST_MATCH_TRIPLE_EQ
 * @expect compile-pass
 * @section 2.5
 * @design 最长匹配: === 识别为单一 Token，不是 == + =
 * @note 正向用例：tokenizer 优先识别最长 Token
 */
function testLongestMatchTripleEq(): void {
  let a: int = 5
  let b: int = 5
  let r: boolean = a === b
}
