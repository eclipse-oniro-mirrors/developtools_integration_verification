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
 * @id TYP_03_02_004_PASS_FUNCTION_TYPE_ALIAS
 * @expect compile-pass
 * @section 3.2
 * @design 用户定义函数类型: type 别名声明函数签名（顶层）、变量声明、lambda 赋值、调用
 * @note 正向用例：验证该特性编译通过的正确用法
 *       注：ArkTS 不允许函数体内 type alias，已移到顶层
 */
type IntOp = (x: int) => int
type BinOp = (a: int, b: int) => int
type Predicate<T> = (x: T) => boolean

function testFunctionTypeAlias(): void {
  let f1: IntOp = (x: int): int => { return x * 2 }
  let r1: int = f1(21)

  let add: BinOp = (a: int, b: int): int => { return a + b }
  let r2: int = add(3, 4)

  let isPositive: Predicate<int> = (x: int): boolean => { return x > 0 }
  let r3: boolean = isPositive(5)
}