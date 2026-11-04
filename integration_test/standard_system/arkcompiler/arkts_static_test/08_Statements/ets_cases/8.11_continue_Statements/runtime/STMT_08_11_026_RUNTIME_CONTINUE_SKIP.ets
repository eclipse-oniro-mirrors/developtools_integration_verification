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
 * @id STMT_08_11_026_RUNTIME_CONTINUE_SKIP
 * @expect runtime
 * @section 8.11
 * @design continue 跳过当前迭代

 * @note 运行时用例：实际执行验证跳过迭代
 */
function main(): void {
  let sum: int = 0
  for (let i: int = 0; i < 10; i++) { if (i == 5) continue; sum = sum + 1 }
  if (sum != 9) { throw new Error("assertion: should skip one iteration, sum=9") }
  console.log("verified")
}
