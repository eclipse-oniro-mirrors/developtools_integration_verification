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
 * @id STMT_08_01_027_RUNTIME_DISCARDED_EXPR
 * @expect runtime
 * @section 8.1
 * @design 表达式语句结果丢弃不影响变量值

 * @note 运行时用例：实际执行验证表达式丢弃
 */
function main(): void {
  let x: int = 10
  x + 100  // discarded
  if (x != 10) { throw new Error("assertion: discarded expr should not affect x") }
  console.log("verified")
}
