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
 * @id STMT_08_05_035_RUNTIME_IF_ELSE_CHAIN
 * @expect runtime
 * @section 8.5
 * @design if-else if-else 链式判断

 * @note 运行时用例：实际执行验证if-else链
 */
function main(): void {
  let val: int = 85
  let grade: string
  if (val >= 90) { grade = "A" }
  else if (val >= 80) { grade = "B" }
  else { grade = "C" }
  if (grade != "B") { throw new Error("assertion: 85 should be B") }
  console.log("verified")
}
