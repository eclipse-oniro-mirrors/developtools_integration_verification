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
 * @id STMT_08_15_1_028_RUNTIME_CATCH_NO_ERROR
 * @expect runtime
 * @section 8.15.1
 * @design 无异常时 catch 块不执行

 * @note 运行时用例：实际执行验证catch不执行
 */
function main(): void {
  let caught: boolean = false
  try { let x: int = 1 } catch (e) { caught = true }
  if (caught) { throw new Error("assertion: catch should NOT run") }
  console.log("verified")
}
