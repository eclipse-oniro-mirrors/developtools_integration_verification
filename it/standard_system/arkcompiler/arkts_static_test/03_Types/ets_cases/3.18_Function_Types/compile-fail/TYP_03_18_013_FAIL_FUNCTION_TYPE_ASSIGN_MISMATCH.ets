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
 * @id TYP_03_18_013_FAIL_FUNCTION_TYPE_ASSIGN_MISMATCH
 * @expect compile-fail
 * @section 3.18
 * @design 函数类型签名不兼容赋值：参数类型不匹配、返回类型不匹配、参数数量不匹配
 * @note 反向用例：验证函数类型不兼容赋值
 */
type StringOp = (s: string) => string
type IntToInt = (n: int) => int

function testFunctionTypeAssignMismatch(): void {
  // 参数类型不匹配: 期望 string 参数，实际 int 参数
  let f1: StringOp = (n: int): string => { return "" + n }

  // 返回类型不匹配: 期望 string 返回，实际 int 返回
  let f2: StringOp = (s: string): int => { return s.length }

  // 不同函数类型之间不兼容赋值
  let f3: IntToInt = (n: int): int => { return n }
  let f4: StringOp = f3

  // 参数数量不匹配: 期望两参数函数，赋值单参数函数
  let f5: (a: int, b: int) => int = (a: int): int => { return a }
}