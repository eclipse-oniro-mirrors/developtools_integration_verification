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
 * @id TYP_03_19_01_015_RUNTIME_READONLY_UNION
 * @expect runtime
 * @section 3.19.1
 * @design readonly 版本优先后可读取数组元素
 * @note 运行时用例：readonly union normalization
 */
type U15 = int[] | readonly int[]

function main(): void {
  let arr: int[] = [1, 2, 3]
  let u: U15 = arr

  let ro: readonly int[] = u
  if (ro.length != 3) {
    throw new Error("readonly array length failed")
  }
  if (ro[0] != 1) {
    throw new Error("readonly array element failed")
  }

  console.log("Readonly union runtime verified")
}