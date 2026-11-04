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
 * @id CON_06_04_02_004_PASS_INT_TO_BYTE_LONG
 * @expect compile-pass
 * @section 6.4.2
 * @design int→byte|long: byte更小忽略, 仅long更大 → OK
 * @note 正向用例：一个成员更小被忽略，仅一个更大成员有效
 */
function testIntToByteLong(): void {
  let i: int = 10
  let u: byte | long = i
}
