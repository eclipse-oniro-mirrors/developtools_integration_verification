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
 * @id LEX_02_06_042_FAIL_EMOJI_IDENTIFIER_START
 * @expect compile-fail
 * @section 2.6
 * @design 补充测试因子：合法 Unicode 码点但非 ID_Start 的 emoji 不能作为标识符起始
 * @note 反向用例：\u{1F600} 是合法码点但不是 IdentifierStart
 */
function testEmojiIdentifierStart(): void {
  let \u{1F600}x: int = 1
}
