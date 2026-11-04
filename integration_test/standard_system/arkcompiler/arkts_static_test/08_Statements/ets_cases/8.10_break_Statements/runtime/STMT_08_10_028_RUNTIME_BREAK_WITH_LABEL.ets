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
 * @id STMT_08_10_028_RUNTIME_BREAK_WITH_LABEL
 * @expect runtime
 * @section 8.10
 * @design 带 label break 退出外层循环

 * @note 运行时用例：实际执行验证break label
 */
function main(): void {
  let count: int = 0
  outer: for (let i: int = 0; i < 5; i++) {
    for (let j: int = 0; j < 5; j++) { count++; if (i == 1 && j == 2) break outer } }
  if (count > 15) { throw new Error("assertion: break outer should exit early") }
  console.log("verified")
}
