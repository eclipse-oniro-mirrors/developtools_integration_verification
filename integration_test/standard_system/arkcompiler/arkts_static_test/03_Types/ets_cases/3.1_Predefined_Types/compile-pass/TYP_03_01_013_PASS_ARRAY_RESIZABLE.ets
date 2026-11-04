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
 * @id TYP_03_01_013_PASS_ARRAY_RESIZABLE
 * @expect compile-pass
 * @section 3.1
 * @design 可变数组 T[] 和 Array<T> 声明、数组字面量、索引读写、length、空数组、push/pop、多维数组
 * @note pop() 返回 T|undefined, 需处理后使用
 */
function testResizableArray(): void {
  let a1: int[] = [1, 2, 3]
  let a2: Array<int> = [4, 5, 6]
  let a3: number[] = [1.0, 2.0, 3.0]
  let a4: string[] = ["a", "b", "c"]
  let a5: boolean[] = [true, false]

  let elem: int = a1[0]
  a1[0] = 10

  let len: int = a1.length

  let empty: int[] = []

  a1.push(4)
  let popped: int | undefined = a1.pop()

  let nested: int[][] = [[1, 2], [3, 4]]
}