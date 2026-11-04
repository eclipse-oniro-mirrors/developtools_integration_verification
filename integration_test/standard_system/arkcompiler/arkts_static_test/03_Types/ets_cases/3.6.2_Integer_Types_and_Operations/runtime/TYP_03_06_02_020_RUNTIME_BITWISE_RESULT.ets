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
 * @id TYP_03_06_02_020_RUNTIME_BITWISE_RESULT
 * @expect runtime
 * @section 3.6.2
 * @design 按位与/异或/或运算结果验证
 * @note 运行时用例：& ^ | 位运算结果
 */
function main(): void {
  let a: int = 0xFF      // 11111111
  let b: int = 0x0F      // 00001111

  if ((a & b) != 0x0F) {
    throw new Error("0xFF & 0x0F should be 0x0F")
  }

  if ((a | b) != 0xFF) {
    throw new Error("0xFF | 0x0F should be 0xFF")
  }

  if ((a ^ b) != 0xF0) {
    throw new Error("0xFF ^ 0x0F should be 0xF0")
  }

  // ~ 按位非（int 是 32 位）
  let x: int = 0
  if (~x != -1) {
    throw new Error("~0 should be -1")
  }

  console.log("Bitwise result verified")
}