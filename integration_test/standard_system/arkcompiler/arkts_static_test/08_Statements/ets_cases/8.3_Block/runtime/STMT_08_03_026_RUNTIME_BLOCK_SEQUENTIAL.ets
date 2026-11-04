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
 * @id STMT_08_03_026_RUNTIME_BLOCK_SEQUENTIAL
 * @expect runtime
 * @section 8.3
 * @design 块语句顺序执行验证

 * @note 运行时用例：实际执行验证块顺序执行
 */
function main(): void {
  let trace: string = ""
  { trace = trace + "A" }
  { trace = trace + "B"
    { trace = trace + "C" } }
  if (trace != "ABC") { throw new Error("assertion: block sequential") }
  console.log("verified")
}
