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
 * @id STMT_08_10_030_RUNTIME_BREAK_WHILE
 * @expect runtime
 * @section 8.10
 * @design while 中使用 break 终止循环

 * @note 运行时用例：实际执行验证while break
 */
function main(): void {
  let sum: int = 0; let i: int = 0
  while (true) { sum = sum + i; i++; if (i >= 5) break }
  if (sum != 10) { throw new Error("assertion: 0+1+2+3+4=10") }
  console.log("verified")
}
