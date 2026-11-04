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
 * @id TYP_03_20_010_PASS_SAFE_CHAIN_NON_NULLISH
 * @expect compile-pass
 * @section 3.20
 * @design 对非 nullish 值使用 ?. 合法但无影响（可能 warning）
 * @note 正向用例：safe chain 用于 non-nullish expression
 */
class C10 { f: int = 1 }

function testSafeChainNonNullish(): void {
  let c: C10 = new C10()
  let v: int = c?.f
}