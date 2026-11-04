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
 * @id LEX_02_07_052_PASS_CASE_MIXED
 * @expect compile-pass
 * @section 2.7
 * @design 大小写敏感: 混合大小写不是关键字
 * @note 正向用例：iNt / nUlL / fAlSe 都是普通标识符
 */
function test052(): void {
  let iNt: int = 1
  let nUlL: int = 2
  let fAlSe: int = 3
  let TrUe: int = 4
}
