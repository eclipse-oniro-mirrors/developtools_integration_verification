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
 * @id STMT_08_11_030_RUNTIME_CONTINUE_EMPTY_LOOP
 * @expect runtime
 * @section 8.11
 * @design continue 在空循环体中

 * @note 运行时用例：实际执行验证空循环体continue
 */
function main(): void {
  let i: int = 0
  while (i < 100) { i++; continue }
  if (i != 100) { throw new Error("assertion: continue should not affect count") }
  console.log("verified")
}
