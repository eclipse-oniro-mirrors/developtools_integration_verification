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
 * @id ERR_12_01_004_RUNTIME_GET_ARRAY_ELEMENT
 * @expect runtime
 * @section 12.1
 * @design 数组越界被 try-catch 捕获（spec 原例）
 * @note 运行时用例
 */
function get_array_element<T>(array: T[], index: int): T | undefined {
  try {
    return array[index]
  } catch (error) {
    if (error instanceof RangeError) {
      return undefined
    }
    throw error
  }
}

function main(): void {
  let arr: int[] = [1, 2, 3]
  let val: int | undefined = get_array_element(arr, -3)
  if (val !== undefined) throw new Error("should be undefined")
  console.log("RangeError caught verified")
}