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
 * @id TYP_03_16_01_005_PASS_LENGTH_PROPERTY
 * @expect compile-pass
 * @section 3.16.1
 * @design 验证数组 length 属性
 * @note 正向用例：验证该特性编译通过的正确用法
 */
let arr: number[] = [1, 2, 3, 4, 5]

function main(): void {
  let len: int = arr.length
  if (len !== 5) throw new Error("length should be 5")
  console.log("verified")
}
