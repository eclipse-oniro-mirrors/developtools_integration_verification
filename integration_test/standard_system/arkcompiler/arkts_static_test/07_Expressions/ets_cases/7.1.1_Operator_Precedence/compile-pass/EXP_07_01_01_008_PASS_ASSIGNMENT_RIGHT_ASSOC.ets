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
 * @id EXP_07_01_01_008_PASS_ASSIGNMENT_RIGHT_ASSOC
 * @expect compile-pass
 * @section 7.1.1
 * @design 赋值 `=` 右结合，`a = b = 5` 等价 `a = (b = 5)`
 * @note 正向用例：验证赋值右结合性
 */
function testAssignmentRightAssoc(): void {
  let a: int = 0
  let b: int = 0
  let c: int = 0
  a = b = c = 5
}
