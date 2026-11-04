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
 * @id LEX_02_08_021_RUNTIME_ARITHMETIC_RESULT
 * @expect runtime
 * @section 2.8
 * @design 算术运算符 + - * / % ** 运行时结果验证
 * @note 运行时用例：实际执行验证语义正确性
 */
function main(): void {
  let a: number = 10
  let b: number = 3
  if ((a + b) !== 13) { throw new Error("addition failed") }
  if ((a - b) !== 7) { throw new Error("subtraction failed") }
  if ((a * b) !== 30) { throw new Error("multiplication failed") }
  if ((a % b) !== 1) { throw new Error("modulo failed") }
  if ((2 ** 10) !== 1024) { throw new Error("power failed") }
}
