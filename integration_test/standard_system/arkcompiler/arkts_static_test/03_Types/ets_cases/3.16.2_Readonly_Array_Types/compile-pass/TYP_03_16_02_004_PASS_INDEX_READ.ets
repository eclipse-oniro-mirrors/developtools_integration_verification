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
 * @id TYP_03_16_02_004_PASS_INDEX_READ
 * @expect compile-pass
 * @section 3.16.2
 * @design 验证只读数组索引读取
 * @note 正向用例：验证该特性编译通过的正确用法
 */
let arr: readonly number[] = [10, 20, 30]

function main(): void {
  let x: number = arr[0]
  let y: number = arr[2]

  if (x !== 10) throw new Error("x should be 10")
  if (y !== 30) throw new Error("y should be 30")
  console.log("verified")
}
