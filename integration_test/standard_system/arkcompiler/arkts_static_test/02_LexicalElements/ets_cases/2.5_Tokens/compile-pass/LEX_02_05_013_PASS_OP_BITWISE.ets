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
 * @id LEX_02_05_013_PASS_OP_BITWISE
 * @expect compile-pass
 * @section 2.5
 * @design Operators Token: 位运算符 & | ^ ~ << >> >>>
 * @note 正向用例：位运算符作为 Token
 */
function testOpBitwise(): void {
  let a: int = 5
  let b: int = 3
  let r1: int = a & b
  let r2: int = a | b
  let r3: int = a ^ b
  let r4: int = ~a
  let r5: int = a << 1
  let r6: int = a >> 1
  let r7: int = a >>> 1
}
