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
 * @id STMT_08_01_029_RUNTIME_COND_EXECUTION
 * @expect runtime
 * @section 8.1
 * @design 条件语句中只有匹配分支执行

 * @note 运行时用例：实际执行验证条件分支
 */
function main(): void {
  let flag: boolean = false
  let x: int = 0
  if (true) { x = 1 }
  if (flag) { x = 99 }
  if (x != 1) { throw new Error("assertion: only true branch executed") }
  console.log("verified")
}
