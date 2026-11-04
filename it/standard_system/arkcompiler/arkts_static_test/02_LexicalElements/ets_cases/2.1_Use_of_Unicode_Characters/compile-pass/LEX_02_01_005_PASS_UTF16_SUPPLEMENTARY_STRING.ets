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
 * @id LEX_02_01_005_PASS_UTF16_SUPPLEMENTARY_STRING
 * @expect compile-pass
 * @section 2.1
 * @design 补充平面字符字符串: \u{1F600}扩展转义、emoji、混合BMP与补充平面 * @note 正向用例：验证该特性编译通过的正确用法

 */
function testUTF16SupplementaryString(): void {
  let s1: string = "\u{1F600}"
  let s2: string = "A\u{1F600}B"
  let s3: string = "\u{1F600}\u{1F601}"
}
