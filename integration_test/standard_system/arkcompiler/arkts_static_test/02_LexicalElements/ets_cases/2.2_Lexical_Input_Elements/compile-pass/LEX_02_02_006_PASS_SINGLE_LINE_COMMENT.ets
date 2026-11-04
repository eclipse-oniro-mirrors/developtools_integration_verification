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
 * @id LEX_02_02_006_PASS_SINGLE_LINE_COMMENT
 * @expect compile-pass
 * @section 2.2
 * @design 单行注释: 整行注释、行末注释、连续多行单行注释 * @note 正向用例：验证该特性编译通过的正确用法

 */
// This is a full-line comment
function testSingleLineComment(): void {
  let x: int = 1  // end-of-line comment
  // another comment
  let y: int = 2
  // comment 1
  // comment 2
  // comment 3
  let z: int = 3
}
