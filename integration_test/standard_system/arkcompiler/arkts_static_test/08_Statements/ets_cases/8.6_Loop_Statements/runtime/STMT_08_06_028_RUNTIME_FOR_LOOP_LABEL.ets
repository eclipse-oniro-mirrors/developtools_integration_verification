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
 * @id STMT_08_06_028_RUNTIME_FOR_LOOP_LABEL
 * @expect runtime
 * @section 8.6
 * @design 简单 for 循环带 label

 * @note 运行时用例：实际执行验证simple labeled for
 */
function main(): void {
  let sum: int = 0
  calc: for (let i: int = 1; i <= 5; i++) { sum = sum + i }
  if (sum != 15) { throw new Error("assertion: sum 1..5 = 15") }
  console.log("verified")
}
