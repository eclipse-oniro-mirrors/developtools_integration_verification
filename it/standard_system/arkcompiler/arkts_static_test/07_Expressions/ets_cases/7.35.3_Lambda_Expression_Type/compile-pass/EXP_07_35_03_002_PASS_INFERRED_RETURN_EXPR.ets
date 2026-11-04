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
 * @id EXP_07_35_03_002_PASS_INFERRED_RETURN_EXPR
 * @expect compile-pass
 * @section 7.35.3
 * @design 验证 Lambda 表达式体可推断返回类型 — 省略返回类型标注，由表达式体类型推断
 * @note 正向用例：单表达式体编译通过，类型推断正确
 */
function main(): void {
  // 表达式体推断 int
  const f1: () => int = () => 42

  // 表达式体推断 string
  const f2: () => string = () => 'hello'

  // 表达式体推断 boolean
  const f3: () => boolean = () => true

  // 表达式体推断 double
  const f4: () => double = () => 3.14

  // 表达式体带参数推断 int
  const f5: (x: int) => int = (x: int) => x * 2

  // 表达式体带参数推断 string（方法调用表达式）
  const f6: (x: int) => int = (x: int) => x + 1

  console.log('' + f1() + f2() + f3() + f4() + f5(21) + f6(41))
}
