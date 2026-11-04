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
 * @id CON_06_01_027_FAIL_DECLARATION_NARROWING
 * @expect compile-fail
 * @section 6.1
 * @design Declaration context: number 类型不能隐式 narrowing 转换为 int 类型
 * @note 反向用例：验证 narrowing 转换在声明上下文中应产生编译时错误
 */
function testDeclarationNarrowingFail(): void {
  let numVal: number = 3.14
  let intVal: int = numVal
}
