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
 * @id EXP_07_02_01_009_PASS_ASSIGNMENT_TARGET
 * @expect compile-pass
 * @section 7.2.1
 * @design 赋值表达式左侧变量类型作为 target type
 * @note 正向用例：验证赋值提供 target type
 */
function testAssignmentTarget(): void {
  let a: int = 0
  a = 42
  let s: string = ''
  s = 'hello'
}
