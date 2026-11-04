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
 * @id EXP_07_23_02_033_RUNTIME_INT_DIVISION_BY_ZERO
 * @expect runtime
 * @section 7.23.2
 * @design 验证整数除零运行时抛 ArithmeticError。
 *         spec：if the divisor value of integer division is detected to be 0
 *         during compilation, then a compile-time error occurs. Otherwise,
 *         an ArithmeticError is thrown during execution.
 * @runtime-throws=ArithmeticError
 * @note 运行时用例：变量除零应抛 ArithmeticError
 */
function main(): void {
  let a: int = 10
  let b: int = 0
  let c: int = a / b
}
main()
