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
 * @id LEX_02_01_004_PASS_UTF16_BMP_STRING
 * @expect compile-pass
 * @section 2.1
 * @design BMP字符在字符串中: 直接字符、\uHHHH转义、混合直接字符与转义 * @note 正向用例：验证该特性编译通过的正确用法

 */
function testUTF16BMPString(): void {
  let s1: string = "Hello世界"
  let s2: string = "\u0041\u0042\u0043"
  let s3: string = "A\u0042C"
}
