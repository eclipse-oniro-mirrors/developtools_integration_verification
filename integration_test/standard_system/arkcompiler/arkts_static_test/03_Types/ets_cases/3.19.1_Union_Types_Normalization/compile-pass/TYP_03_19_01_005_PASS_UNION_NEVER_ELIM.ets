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
 * @id TYP_03_19_01_005_PASS_UNION_NEVER_ELIM
 * @expect compile-pass
 * @section 3.19.1
 * @design never 类型消除：never | number → number
 * @note 正向用例：验证联合类型中 never 被消除
 */
type WithNever = never | number

function main(): void {
  let x: WithNever = 42
  console.log("verified")
}