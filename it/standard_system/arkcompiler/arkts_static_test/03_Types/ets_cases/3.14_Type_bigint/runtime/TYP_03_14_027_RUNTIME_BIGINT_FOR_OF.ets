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
 * @id TYP_03_14_027_RUNTIME_BIGINT_FOR_OF
 * @expect runtime
 * @section 3.14
 * @design 验证 bigint 数组可迭代性
 * @note 运行时用例：实际执行验证 bigint 数组遍历
 */
function main(): void {
  let arr: bigint[] = [1n, 2n, 3n, 4n, 5n]
  let sum: bigint = 0n

  for (let b of arr) {
    sum = sum + b
  }

  if (sum !== 15n) throw new Error("sum should be 15")

  console.log("verified")
}
