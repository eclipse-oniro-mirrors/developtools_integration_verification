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
 * @id EXP_07_35_02_007_PASS_VOID_EMPTY_BLOCK
 * @expect compile-pass
 * @section 7.35.2
 * @design 验证 void 返回类型的 Lambda 可以使用空块体 `(): void => {}`。Spec 规定只有非 void/non-never 返回类型才要求 return 或单表达式体
 * @note 正向用例：void 返回类型的空块体不会触发 "no return in non-void lambda" 编译错误
 */
function main(): void {
  // void 返回类型 + 空块体
  const f1: () => void = (): void => {}
  f1()

  // void 返回类型 + 仅注释/空语句块
  const f2: (x: int) => void = (x: int): void => {
    let y: int = x * 2
  }
  f2(5)

  // void 返回类型 + 仅有 log 调用
  const f3: (msg: string) => void = (msg: string): void => {
    console.log(msg)
}
  f3('hello from void lambda')

  console.log('verified')
}
