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
 * @id EXP_07_35_03_004_PASS_CONTEXT_INFERRED_PARAM
 * @expect compile-pass
 * @section 7.35.3
 * @design 验证 Lambda 参数类型可以从上下文（函数类型变量声明）推断，无需显式标注
 * @note 正向用例：参数类型从上下文推断编译通过
 */
function main(): void {
  // 上下文推断单参数 int
  const f1: (x: int) => int = x => x * 2
  let r1: int = f1(21)

  // 上下文推断单参数 string
  const f2: (x: string) => int = x => x.length
  let r2: int = f2('hello')

  // 上下文推断单参数 boolean
  const f3: (x: int) => boolean = x => x > 0
  let r3: boolean = f3(5)

  // 上下文推断多参数
  const f4: (x: int, y: int) => int = (x, y) => x + y
  let r4: int = f4(10, 32)

  // 上下文推断返回类型
  const f5: () => int = () => 42
  let r5: int = f5()

  console.log('' + r1 + r2 + r3 + r4 + r5)
}
