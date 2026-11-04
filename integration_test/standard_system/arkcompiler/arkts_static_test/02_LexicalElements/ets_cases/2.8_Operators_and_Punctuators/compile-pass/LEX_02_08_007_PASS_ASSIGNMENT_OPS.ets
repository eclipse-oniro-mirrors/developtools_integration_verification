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
 * @id LEX_02_08_007_PASS_ASSIGNMENT_OPS
 * @expect compile-pass
 * @section 2.8
 * @design 简单赋值与算术复合赋值 = += -= *= /= %= **=
 * @note 正向用例：验证该特性编译通过的正确用法
 */
function testAssignmentOps(): void {
  let x: number = 10
  x = 20
  x += 5
  x -= 2
  x *= 3
  x /= 2
  x %= 4
  x **= 2
}
