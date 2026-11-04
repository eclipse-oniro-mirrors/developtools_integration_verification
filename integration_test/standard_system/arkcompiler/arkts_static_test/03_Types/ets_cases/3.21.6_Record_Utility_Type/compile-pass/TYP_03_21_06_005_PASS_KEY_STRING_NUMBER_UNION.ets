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
 * @id TYP_03_21_06_005_PASS_KEY_STRING_NUMBER_UNION
 * @expect compile-pass
 * @section 3.21.6
 * @design string | number 作 key
 * @note 正向用例：spec R6
 */
type R5 = Record<string | number, Object>

function testKeyStringNumberUnion(): void {
  let r: R5 = {"a": new Object(), 0: new Object()}
}