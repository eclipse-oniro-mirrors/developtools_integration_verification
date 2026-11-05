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
 * @id LEX_02_01_026_RUNTIME_SURROGATE_PAIR_EQUIVALENCE
 * @expect runtime
 * @section 2.1
 * @design 代理对表示与\u{}转义等价性验证 * @note 运行时用例：实际执行验证语义正确性

 */
function main(): void {
  let s1: string = "\uD83D\uDE00"
  let s2: string = "\u{1F600}"
  if (s1 !== s2) { throw new Error("Surrogate pair should equal \\u{} escape") }
  if (s1.length !== 2) { throw new Error("Surrogate pair length should be 2") }
}
