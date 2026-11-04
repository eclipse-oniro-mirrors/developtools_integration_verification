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
 * @id TYP_03_03_005_PASS_INPLACE_ARRAY
 * @expect compile-pass
 * @section 3.3
 * @design 就地数组类型声明 T[]、Array<T>、readonly T[]
 * @note 正向用例：验证就地数组类型声明
 */
function testInplaceArray(): void {
  let a1: number[] = [1.0, 2.0, 3.0]
  let a2: Array<int> = [1, 2, 3]
  let a3: readonly string[] = ["a", "b"]
  let a4: int[][] = [[1, 2], [3, 4]]
  let a5: Array<Array<int>> = [[1], [2]]
}