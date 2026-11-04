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
 * @id LEX_02_03_019_PASS_WS_IN_STRING_CONTENT
 * @expect compile-pass
 * @section 2.3
 * @design 字符串字面量内的空白属于字符串内容，不是分隔符 * @note 正向用例：验证该特性编译通过的正确用法

 */
function testWsInStringContent(): void {
  let s1: string = "hello world"
  let s2: string = "tab	inside"
  let s3: string = "nbsp inside"
  let s4: string = `template    with		various whitespaces`
}
