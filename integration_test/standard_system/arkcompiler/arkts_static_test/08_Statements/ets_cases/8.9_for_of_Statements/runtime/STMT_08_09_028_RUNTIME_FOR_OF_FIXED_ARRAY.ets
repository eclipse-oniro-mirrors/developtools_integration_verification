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
 * @id STMT_08_09_028_RUNTIME_FOR_OF_FIXED_ARRAY
 * @expect runtime
 * @section 8.9
 * @design FixedArray for-of 迭代

 * @note 运行时用例：实际执行验证FixedArray迭代
 */
function main(): void {
  let arr: int[] = [10, 20, 30]
  let sum: int = 0
  for (let x of arr) { sum = sum + x }
  if (sum != 60) { throw new Error("assertion: 10+20+30=60") }
  console.log("verified")
}
