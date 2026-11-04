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
 * @id STMT_08_08_030_RUNTIME_FOR_INFINITE_BREAK
 * @expect runtime
 * @section 8.8
 * @design for 无限循环 + break 退出

 * @note 运行时用例：实际执行验证for+break
 */
function main(): void {
  let count: int = 0
  for (let i: int = 0; i < 100; i++) { count++; if (count >= 5) break }
  if (count != 5) { throw new Error("assertion: break at count=5") }
  console.log("verified")
}
