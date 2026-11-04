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
 * @id TYP_03_08_011_RUNTIME_ANY_NULLISH_HOLD
 * @expect runtime
 * @section 3.8
 * @design Any 是 nullish 类型，可持有 null/undefined（与 Object 不同）
 * @note 运行时用例：nullish 行为
 */
function main(): void {
  let a: Any = 1
  a = null
  if (a !== null) {
    throw new Error("Any should hold null")
  }

  a = undefined
  if (a !== undefined) {
    throw new Error("Any should hold undefined")
  }

  // Any 数组
  let arr: Array<Any> = [1, null, "x", undefined, true]
  if (arr.length != 5) {
    throw new Error("Any array length failed")
  }
  if (arr[1] !== null) {
    throw new Error("arr[1] should be null")
  }
  if (arr[3] !== undefined) {
    throw new Error("arr[3] should be undefined")
  }

  console.log("Any nullish hold verified")
}