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
 * @id LEX_02_06_002_PASS_LL_LETTER_START
 * @expect compile-pass
 * @section 2.6
 * @design IdentifierStart: Ll (Lowercase Letter) - a, b, z 等小写英文字母
 * @note 正向用例：UnicodeIDStart 的 Ll 类别
 */
function testLlStart(): void {
  let a: int = 1
  let b: int = 2
  let z: int = 3
  let myName: int = 100
}
