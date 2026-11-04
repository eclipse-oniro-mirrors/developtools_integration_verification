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
 * @id CON_06_01_028_FAIL_ASSIGNMENT_NARROWING
 * @expect compile-fail
 * @section 6.1
 * @design Assignment context: number 类型不能隐式 narrowing 转换为 int 类型（赋值上下文）
 * @note 反向用例：验证 narrowing 转换在赋值上下文中应产生编译时错误
 */
function testAssignmentNarrowingFail(): void {
  let numVal: number = 5.5
  let intVal: int = 0
  intVal = numVal
}
