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
 * @id CON_06_01_001_PASS_DECLARATION_VAR_BASIC
 * @expect compile-pass
 * @section 6.1
 * @design Declaration context: 带显式类型标注的变量声明，表达式类型与目标类型完全匹配
 * @note 正向用例：验证该特性编译通过的正确用法
 */
function testDeclarationVarBasic(): void {
  let numVar: number = 42
  let strVar: string = 'hello'
  let boolVar: boolean = true
  let intVar: int = 100
  let doubleVar: double = 3.14
}
