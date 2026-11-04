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
 * @id TYP_03_16_005_PASS_ARRAY_INDEX
 * @expect compile-pass
 * @section 3.16
 * @design 验证数组索引访问
 * @note 正向用例：验证该特性编译通过的正确用法
 */
let arr: number[] = [10, 20, 30]

function main(): void {
  if (arr[0] !== 10) throw new Error("arr[0] should be 10")
  if (arr[1] !== 20) throw new Error("arr[1] should be 20")
  if (arr[2] !== 30) throw new Error("arr[2] should be 30")
  console.log("verified")
}
