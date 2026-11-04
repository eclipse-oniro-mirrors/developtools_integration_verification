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
 * @id TYP_03_19_03_009_FAIL_KEYOF_EMPTY_ASSIGN
 * @expect compile-fail
 * @section 3.19.3
 * @design 空类 keyof 等价 never，因此不能赋任何字符串
 * @note 反向用例：keyof empty class = never
 */
class Empty9 {}
type KeysOfEmpty9 = keyof Empty9

function testEmptyAssignFail(): void {
  let k: KeysOfEmpty9 = "anything"
}