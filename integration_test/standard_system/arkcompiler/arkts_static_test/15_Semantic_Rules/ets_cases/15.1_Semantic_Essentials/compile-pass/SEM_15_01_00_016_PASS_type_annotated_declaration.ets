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
/*
 * @id SEM_15_01_00_016_PASS_type_annotated_declaration
 * @expect compile-pass
 * @section 15.1
 * @design 语义基础：类型注解的变量声明
 * @note 测试带类型注解的变量声明：int 和 string 类型的变量声明及使用
 */

// 测试类型注解的变量声明
function testTypeAnnotatedDeclaration(): void {
  let x: int = 10
  let y: string = 'hello'

  console.log(`${x} ${y}`)
}
