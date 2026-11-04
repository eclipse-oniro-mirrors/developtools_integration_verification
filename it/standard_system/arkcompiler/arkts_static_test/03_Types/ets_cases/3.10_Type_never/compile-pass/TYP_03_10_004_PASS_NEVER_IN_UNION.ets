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
 * @id TYP_03_10_004_PASS_NEVER_IN_UNION
 * @expect compile-pass
 * @section 3.10
 * @design never 在联合类型中（被吸收）
 * @note 正向用例
 */
function testNeverInUnion(): void {
  // never 是 bottom type，T | never = T
  let u: int | never = 1
  u = 2
}