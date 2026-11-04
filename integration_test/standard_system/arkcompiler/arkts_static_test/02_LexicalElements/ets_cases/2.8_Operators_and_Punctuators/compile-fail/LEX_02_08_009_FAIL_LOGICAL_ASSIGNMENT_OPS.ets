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
 * @id LEX_02_08_009_FAIL_LOGICAL_ASSIGNMENT_OPS
 * @expect compile-fail
 * @section 2.8
 * @design &&= 和 ||= 当前编译器不支持（spec 列出但实现缺失）
 * @note 反向用例：记录编译器与 spec 不一致
 */
function testLogicalAssignmentOps(): void {
  let a: boolean = true
  let b: boolean = false
  a &&= b
  a ||= true
}
