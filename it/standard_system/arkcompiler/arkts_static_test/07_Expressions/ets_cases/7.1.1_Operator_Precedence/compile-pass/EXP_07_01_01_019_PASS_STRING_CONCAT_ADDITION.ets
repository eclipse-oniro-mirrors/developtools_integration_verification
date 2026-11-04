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
 * @id EXP_07_01_01_019_PASS_STRING_CONCAT_ADDITION
 * @expect compile-pass
 * @section 7.1.1
 * @design 字符串拼接 `+` 与数值加法 `+` 同优先级，左结合
 * @note 正向用例：验证字符串拼接与数值加法优先级相同
 */
function testStringConcatAddition(): void {
  let s1: string = 'a' + 1 + 2
  let s2: string = 'a' + (1 + 2)
  let s3: string = 1 + 2 + 'a'
}
