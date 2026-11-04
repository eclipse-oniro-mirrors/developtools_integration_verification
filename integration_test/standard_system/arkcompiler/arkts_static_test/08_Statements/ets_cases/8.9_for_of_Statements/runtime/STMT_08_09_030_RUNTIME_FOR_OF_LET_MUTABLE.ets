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
 * @id STMT_08_09_030_RUNTIME_FOR_OF_LET_MUTABLE
 * @expect runtime
 * @section 8.9
 * @design for-of 中 let 变量可修改

 * @note 运行时用例：实际执行验证let可变
 */
function main(): void {
  let arr: int[] = [1, 2, 3]
  let last: int = 0
  for (let x of arr) { last = x }
  if (last != 3) { throw new Error("assertion: last should be 3") }
  console.log("verified")
}
