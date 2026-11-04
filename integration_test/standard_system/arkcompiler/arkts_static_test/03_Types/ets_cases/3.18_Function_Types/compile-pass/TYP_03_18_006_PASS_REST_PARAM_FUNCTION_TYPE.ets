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
 * @id TYP_03_18_006_PASS_REST_PARAM_FUNCTION_TYPE
 * @expect compile-pass
 * @section 3.18
 * @design 函数类型含 rest 参数
 * @note 正向用例：验证函数类型中 rest 参数的使用
 */
type VarArgs = (...nums: int[]) => int
type MixedWithRest = (first: string, ...rest: int[]) => void

function testRestParamFunctionType(): void {
  let sum: VarArgs = (...nums: int[]): int => {
    let s: int = 0
    for (let n of nums) {
      s += n
    }
    return s
  }
  let r1: int = sum(1, 2, 3)
  let r2: int = sum()

  let printer: MixedWithRest = (first: string, ...rest: int[]): void => {}
  printer("hello", 1, 2, 3)
  printer("world")
}