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
 * @id TYP_03_16_01_013_RUNTIME_SHRINK_ARRAY
 * @expect runtime
 * @section 3.16.1
 * @design 验证数组长度收缩运行时行为
 * @note 运行时用例：实际执行验证数组收缩
 */
function main(): void {
  let arr: number[] = [0, 0, 0, 0, 0]

  if (arr.length !== 5) throw new Error("initial length should be 5")

  arr.length = 3
  if (arr.length !== 3) throw new Error("length should be 3 after shrink")

  console.log("verified")
}
