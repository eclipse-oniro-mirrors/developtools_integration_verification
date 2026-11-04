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
 * @id EXP2_17_01_01_004_PASS_UNICODE_ESCAPE
 * @expect compile-pass
 * @section 17.1.1
 * @design Unicode 转义字面量：验证 c'A' 格式的 Unicode 转义序列（A = 'A'）
 * @note 正向用例：验证该特性编译通过的正确用法
 */
function testUnicodeEscapeLiteral(): void {
  let uniA: char = c'A'    // 'A' = U+0041 (via A escape)
  let uniDEL: char = c'' // DEL = U+007F (via  escape)
  let uniLowerA: char = c'a' // 'a' = U+0061
  console.log(uniA)
  console.log(uniDEL)
  console.log(uniLowerA)
}
