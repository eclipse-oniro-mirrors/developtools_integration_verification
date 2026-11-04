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
 * @id STMT_08_07_034_RUNTIME_WHILE_ZERO_ITER
 * @expect runtime
 * @section 8.7
 * @design while 条件初始为 false 执行零次

 * @note 运行时用例：实际执行验证while零次
 */
function main(): void {
  let count: int = 0
  while (false) { count++ }
  if (count != 0) { throw new Error("assertion: while(false) should not execute") }
  console.log("verified")
}
