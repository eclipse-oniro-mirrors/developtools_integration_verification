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
 * @id CON_06_03_011_PASS_ENUM_BITWISE
 * @expect compile-pass
 * @section 6.3
 * @design 数值基类型枚举参与位运算: enum | int / enum & int
 * @note 正向用例：验证枚举在数值上下文的位运算编译通过
 */
enum Flags {
  None = 0,
  Read = 1,
  Write = 2
}

function testEnumBitwise(): void {
  let r1: int = Flags.Read | Flags.Write
  let r2: int = Flags.Read & 1
  let r3: int = 3 | Flags.Write
}
