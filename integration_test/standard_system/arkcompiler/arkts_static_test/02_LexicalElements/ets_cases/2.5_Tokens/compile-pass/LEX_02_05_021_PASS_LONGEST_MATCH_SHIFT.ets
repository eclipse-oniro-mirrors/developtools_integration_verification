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
 * @id LEX_02_05_021_PASS_LONGEST_MATCH_SHIFT
 * @expect compile-pass
 * @section 2.5
 * @design 最长匹配: >>> 识别为单一 Token，不是 >> + >
 * @note 正向用例：无符号右移作为单一 Token
 */
function testLongestMatchShift(): void {
  let a: int = 16
  let r1: int = a >> 1
  let r2: int = a >>> 1
}
