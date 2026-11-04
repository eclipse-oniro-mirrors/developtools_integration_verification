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
 * @id TYP_03_20_011_FAIL_NONNULLISH_ASSIGN_NULL
 * @expect compile-fail
 * @section 3.20
 * @design non-nullish 类型不能赋 null/undefined
 * @note 反向用例：int/string/Object 都不能直接持有 nullish
 */
function testNonNullishAssignNullFail(): void {
  let i: int = null
  let s: string = undefined
  let o: Object = null
}