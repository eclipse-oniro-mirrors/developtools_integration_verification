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
 * @id EXP_07_02_01_002_PASS_STANDALONE_STRING
 * @expect compile-pass
 * @section 7.2.1
 * @design standalone 字符串字面量类型推断为 string，`let a = "hello"`
 * @note 正向用例：验证 standalone 字符串字面量类型推断
 */
function testStandaloneString(): void {
  let a = 'hello'
  let b = ''
  let c = '42'
}
