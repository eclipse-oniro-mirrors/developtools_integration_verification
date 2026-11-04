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
 * @id LEX_02_05_005_PASS_KEYWORD_DECLARATION
 * @expect compile-pass
 * @section 2.5
 * @design Keywords Token: let / const 声明关键字
 * @note 正向用例：声明关键字作为 Token
 */
function testKeywordDeclaration(): void {
  let mutableVar: int = 1
  const immutableVar: int = 2
  mutableVar = mutableVar + immutableVar
}
