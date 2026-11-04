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
 * @id CON_06_03_02_010_PASS_CHAR_BYTE_EQUALITY
 * @expect compile-pass
 * @section 6.3.2
 * @design char == byte / char != byte: char 和 byte 均 widening 为 int 后判等
 * @note 正向用例：验证该特性编译通过的正确用法
 */
function testCharByteEquality(): void {
  let c: char = c'0'
  let b: byte = 48
  let r1: boolean = c == b
  let r2: boolean = c != b
}
