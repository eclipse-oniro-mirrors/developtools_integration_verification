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
 * @id TYP_03_11_005_PASS_VOID_METHOD_LAMBDA
 * @expect compile-pass
 * @section 3.11
 * @design void 常用于函数/方法/lambda 返回类型
 * @note 正向用例：无 return 或 return 空语句
 */
function foo(): void {}

class C5 {
  bar(): void {
    return
  }
}

type FunctionWithNoParametersType = () => void

function testVoidMethodLambda(): void {
  foo()
  let c: C5 = new C5()
  c.bar()

  let funcTypeVariable: FunctionWithNoParametersType = (): void => {}
  funcTypeVariable()
}