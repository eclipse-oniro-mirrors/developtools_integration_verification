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
 * @id TYP_03_19_01_010_FAIL_STRING_ABSORBS_LITERAL_NUMBER
 * @expect compile-fail
 * @section 3.19.1
 * @design string literal 被 string 吸收后仍不能接受 number（若 union 无 number）
 * @note 反向用例："a" | string → string，不接受 number
 */
type U10 = "a" | "b" | string

function testStringAbsorbFail(): void {
  let u: U10 = 42
  u = true
}