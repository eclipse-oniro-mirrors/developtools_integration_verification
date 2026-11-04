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
 * @id TYP_03_18_001_PASS_BASIC_FUNCTION_TYPE
 * @expect compile-pass
 * @section 3.18
 * @design 函数类型基本声明：变量声明、type 别名、空参数、单参数、多参数
 * @note 正向用例：验证函数类型基本声明编译通过
 */
type IntOp = (x: int) => int
type BinOp = (a: int, b: int) => int
type VoidOp = () => void
type NoParamReturnInt = () => int

function testBasicFunctionType(): void {
  let f1: (x: int) => int = (x: int): int => { return x * 2 }
  let f2: (a: int, b: int) => int = (a: int, b: int): int => { return a + b }
  let f3: () => void = (): void => {}
  let f4: () => int = (): int => { return 42 }
  let f5: IntOp = (x: int): int => { return x + 1 }
  let f6: BinOp = (a: int, b: int): int => { return a - b }
  let f7: VoidOp = (): void => {}
  let f8: NoParamReturnInt = (): int => { return 0 }
}