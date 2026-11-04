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
 * @id TYP_03_16_016_RUNTIME_EMPTY_ARRAY
 * @expect runtime
 * @section 3.16
 * @design 验证空数组运行时行为
 * @note 运行时用例：实际执行验证空数组操作
 */
function main(): void {
  let arr: number[] = []

  if (arr.length !== 0) throw new Error("length should be 0")

  arr.push(1)
  if (arr.length !== 1) throw new Error("length should be 1 after push")
  if (arr[0] !== 1) throw new Error("arr[0] should be 1")

  console.log("verified")
}
