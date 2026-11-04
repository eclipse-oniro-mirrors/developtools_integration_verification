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
 * @id TYP_03_18_018_FAIL_VOID_RETURN_ASSIGN_TO_NONVOID
 * @expect compile-fail
 * @section 3.18
 * @design void 返回函数类型不能赋值给非 void 返回函数类型
 * @note 反向用例：() => void 赋值给 () => int 应编译失败
 */
function testVoidReturnAssignFail(): void {
  let voidFunc: () => void = (): void => {}
  let intFunc: () => int = voidFunc // Compile-time error: void not assignable to int
}