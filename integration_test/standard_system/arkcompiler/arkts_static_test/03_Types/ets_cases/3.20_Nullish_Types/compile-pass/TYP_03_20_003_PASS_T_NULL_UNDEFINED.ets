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
 * @id TYP_03_20_003_PASS_T_NULL_UNDEFINED
 * @expect compile-pass
 * @section 3.20
 * @design T | null | undefined 可持有 T/null/undefined
 * @note 正向用例：三态 nullish 类型
 */
function testTNullUndefined(): void {
  let v: string | null | undefined = "hello"
  v = null
  v = undefined
  v = "world"
}