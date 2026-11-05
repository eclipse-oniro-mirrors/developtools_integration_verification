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
 * @id LEX_02_07_053_RT_TYPEOF
 * @expect runtime
 * @section 2.7
 * @design 关键字 typeof 运行时返回字符串
 * @note 运行时用例：typeof 操作符
 */
function main(): void {
  let n: int = 42
  let s: string = "hello"
  let b: boolean = true
  let tn: string = typeof n
  let ts: string = typeof s
  let tb: string = typeof b
  // typeof 返回非空字符串
  if (tn.length === 0) { throw new Error("typeof int returned empty") }
  if (ts.length === 0) { throw new Error("typeof string returned empty") }
  if (tb.length === 0) { throw new Error("typeof boolean returned empty") }
}
