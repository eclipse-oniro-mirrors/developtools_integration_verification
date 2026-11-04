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
 * @id LEX_02_08_027_RUNTIME_INC_DEC_PREPOST
 * @expect runtime
 * @section 2.8
 * @design 自增自减前置/后置运算符返回值差异
 * @note 运行时用例：实际执行验证语义正确性
 */
function main(): void {
  let x: number = 5
  let post: number = x++
  if (post !== 5) { throw new Error("post-increment return wrong") }
  if (x !== 6) { throw new Error("post-increment side-effect wrong") }
  let pre: number = ++x
  if (pre !== 7) { throw new Error("pre-increment return wrong") }
  if (x !== 7) { throw new Error("pre-increment side-effect wrong") }
  let post2: number = x--
  if (post2 !== 7) { throw new Error("post-decrement return wrong") }
  if (x !== 6) { throw new Error("post-decrement side-effect wrong") }
  let pre2: number = --x
  if (pre2 !== 5) { throw new Error("pre-decrement return wrong") }
  if (x !== 5) { throw new Error("pre-decrement side-effect wrong") }
}
