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
 * @id TYP_03_16_001_PASS_RESIZABLE_ARRAY
 * @expect compile-pass
 * @section 3.16
 * @design 验证 Resizable Array 声明与初始化
 * @note 正向用例：验证该特性编译通过的正确用法
 */
let arr1: number[] = [1, 2, 3]
let arr2: Array<number> = [4, 5, 6]
let arr3: string[] = ["a", "b", "c"]

function main(): void {
  if (arr1.length !== 3) throw new Error("arr1 length assert failed")
  if (arr2.length !== 3) throw new Error("arr2 length assert failed")
  if (arr3.length !== 3) throw new Error("arr3 length assert failed")
  console.log("verified")
}
