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
 * @id LEX_02_08_001_PASS_ARITHMETIC_OPS
 * @expect compile-pass
 * @section 2.8
 * @design 算术运算符 + - * / % ** 在数值类型上的基本组合
 * @note 正向用例：验证该特性编译通过的正确用法
 */
function testArithmeticOps(): void {
  let a: number = 10
  let b: number = 3
  let r1: number = a + b
  let r2: number = a - b
  let r3: number = a * b
  let r4: number = a / b
  let r5: number = a % b
  let r6: number = a ** b
  let s: string = "Hello, " + "World"
}
