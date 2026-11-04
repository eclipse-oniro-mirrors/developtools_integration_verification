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
 * @id STMT_08_07_035_RUNTIME_DO_AT_LEAST_ONCE
 * @expect runtime
 * @section 8.7
 * @design do-while 至少执行一次

 * @note 运行时用例：实际执行验证do-while一次
 */
function main(): void {
  let count: int = 0
  do { count++ } while (false)
  if (count != 1) { throw new Error("assertion: do-while should execute at least once") }
  console.log("verified")
}
