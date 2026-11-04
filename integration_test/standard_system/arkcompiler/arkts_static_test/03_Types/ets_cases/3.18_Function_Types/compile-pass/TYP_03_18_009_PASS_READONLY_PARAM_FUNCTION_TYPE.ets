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
 * @id TYP_03_18_009_PASS_READONLY_PARAM_FUNCTION_TYPE
 * @expect compile-pass
 * @section 3.18
 * @design 函数类型含 readonly 数组参数
 * @note 正向用例：验证 readonly 参数在函数类型中的使用
 */
type ReadOnlyArrayOp = (arr: readonly int[]) => int
type ReadOnlyTupleOp = (t: readonly [int, string]) => int

function sumReadOnly(arr: readonly int[]): int {
  let s: int = 0
  for (let v of arr) {
    s += v
  }
  return s
}

function testReadonlyParamFunctionType(): void {
  let op: ReadOnlyArrayOp = (arr: readonly int[]): int => {
    let s: int = 0
    for (let v of arr) {
      s += v
    }
    return s
  }
  let arr: readonly int[] = [1, 2, 3]
  let r1: int = op(arr)

  let top: ReadOnlyTupleOp = (t: readonly [int, string]): int => { return t[0] }
  let tup: readonly [int, string] = [10, "hello"]
  let r2: int = top(tup)
}