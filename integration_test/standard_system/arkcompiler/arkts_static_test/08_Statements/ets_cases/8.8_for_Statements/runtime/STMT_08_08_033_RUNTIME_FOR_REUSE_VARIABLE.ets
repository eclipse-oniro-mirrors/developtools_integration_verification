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
 * @id STMT_08_08_033_RUNTIME_FOR_REUSE_VARIABLE
 * @expect runtime
 * @section 8.8
 * @design for 循环复用外部变量

 * @note 运行时用例：实际执行验证复用外部变量
 */
function main(): void {
  let i: int
  let sum: int = 0
  for (i = 1; i <= 10; i++) { sum = sum + i }
  if (sum != 55) { throw new Error("assertion: 1..10 sum=55") }
  console.log("verified")
}
