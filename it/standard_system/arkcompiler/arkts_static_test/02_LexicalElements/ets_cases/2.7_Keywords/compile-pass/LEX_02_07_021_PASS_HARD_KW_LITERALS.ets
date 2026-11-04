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
 * @id LEX_02_07_021_PASS_HARD_KW_LITERALS
 * @expect compile-pass
 * @section 2.7
 * @design 硬关键字: true, false, null, undefined
 * @note 正向用例：字面量关键字
 */
function test021(): void {
  let t: boolean = true
  let f: boolean = false
  let n: string | null = null
  let u: string | undefined = undefined
}
