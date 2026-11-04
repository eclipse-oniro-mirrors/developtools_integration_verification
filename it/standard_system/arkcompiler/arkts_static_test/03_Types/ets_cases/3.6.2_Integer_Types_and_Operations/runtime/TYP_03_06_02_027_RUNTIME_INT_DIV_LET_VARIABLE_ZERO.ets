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
 * @id TYP_03_06_02_027_RUNTIME_INT_DIV_LET_VARIABLE_ZERO
 * @expect runtime
 * @section 3.6.2
 * @design 整数 let 变量 = 0 作除数：编译通过，运行时抛 ArithmeticError
 * @runtime-throws=ArithmeticError
 * @note 运行时用例：let 不参与常量传播（合理设计）
 */
function main(): void {
  let a: int = 0
  let c: int = 10 / a
  console.log(c)
}