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
 * @id LEX_02_02_001_PASS_FOUR_ELEMENT_TYPES
 * @expect compile-pass
 * @section 2.2
 * @design 一行代码中同时存在White Spaces、Tokens、Line Separators(隐含)、Comments四种词法输入元素 * @note 正向用例：验证该特性编译通过的正确用法

 */
function testFourElementTypes(): void {
  let x: number = 1  // comment with spaces
}
