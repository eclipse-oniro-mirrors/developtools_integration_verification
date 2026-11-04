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
 * @id STMT_08_01_028_RUNTIME_STMT_ORDER
 * @expect runtime
 * @section 8.1
 * @design 语句执行顺序验证

 * @note 运行时用例：实际执行验证语句顺序
 */
function main(): void {
  let log: string = ""
  log = log + "A"
  log = log + "B"
  log = log + "C"
  if (log != "ABC") { throw new Error("assertion: statements execute in order") }
  console.log("verified")
}
