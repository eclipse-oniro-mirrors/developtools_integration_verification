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
 * @id TYP_03_18_024_RUNTIME_REST_PARAM_FUNCTION_TYPE
 * @expect runtime
 * @section 3.18
 * @design 函数类型含 rest 参数的运行时行为验证
 * @note 运行时用例：验证 rest 参数函数类型调用
 */
type VarArgs = (...nums: int[]) => int

function main(): void {
  let sum: VarArgs = (...nums: int[]): int => {
    let s: int = 0
    for (let n of nums) {
      s += n
    }
    return s
  }

  if (sum() != 0) {
    throw new Error("sum() should be 0")
  }
  if (sum(1, 2, 3) != 6) {
    throw new Error("sum(1, 2, 3) should be 6")
  }
  if (sum(10, 20, 30, 40) != 100) {
    throw new Error("sum(10, 20, 30, 40) should be 100")
  }

  console.log("Rest param function type verified")
}