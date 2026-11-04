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
 * @id STMT_08_11_028_RUNTIME_CONTINUE_ODD_ONLY
 * @expect runtime
 * @section 8.11
 * @design continue 收集奇数

 * @note 运行时用例：实际执行验证收集奇数
 */
function main(): void {
  let oddSum: int = 0
  for (let i: int = 1; i <= 10; i++) { if (i % 2 == 0) continue; oddSum = oddSum + i }
  if (oddSum != 25) { throw new Error("assertion: 1+3+5+7+9=25") }
  console.log("verified")
}
