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
 * @id LEX_02_09_03_028_PASS_HEX_FLOAT
 * @expect compile-fail
 * @section 2.9.3
 * @design 十六进制浮点字面量（hex float）
 * @note 正向用例：spec/lexical.md 列出 hex float 语法 0x1.Fp10
 */
function testHexFloat(): void {
  let a: double = 0x1.Fp10
  let b: double = 0x1.0p0
  let c: double = 0xABCD.EFp-10
}
