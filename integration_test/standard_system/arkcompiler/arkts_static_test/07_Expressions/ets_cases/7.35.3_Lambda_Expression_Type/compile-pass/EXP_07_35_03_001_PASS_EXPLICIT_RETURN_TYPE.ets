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
 * @id EXP_07_35_03_001_PASS_EXPLICIT_RETURN_TYPE
 * @expect compile-pass
 * @section 7.35.3
 * @design 验证 Lambda 表达式显式返回类型标注与函数类型变量匹配的各种情况
 * @note 正向用例：Lambda 标注返回类型后赋值给对应函数类型变量，验证类型匹配
 */
function main(): void {
  // int 返回类型
  const f1: () => int = (): int => 42
  let r1: int = f1()

  // string 返回类型
  const f2: () => string = (): string => 'hello'
  let r2: string = f2()

  // boolean 返回类型
  const f3: () => boolean = (): boolean => true
  let r3: boolean = f3()

  // double 返回类型
  const f4: () => double = (): double => 3.14
  let r4: double = f4()

  // 单参数 int 返回类型
  const f5: (x: int) => int = (x: int): int => x + 1
  let r5: int = f5(41)

  // 多参数 int 返回类型
  const f6: (x: int, y: int) => int = (x: int, y: int): int => x + y
  let r6: int = f6(10, 32)

  console.log('' + r1 + r2 + r3 + r4 + r5 + r6)
}
