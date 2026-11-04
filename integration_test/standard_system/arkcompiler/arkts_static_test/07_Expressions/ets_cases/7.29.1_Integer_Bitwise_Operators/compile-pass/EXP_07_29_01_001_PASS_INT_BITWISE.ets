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
 * @id EXP_07_29_01_001_PASS_INT_BITWISE
 * @expect compile-pass
 * @section 7.29.1
 * @design int 位运算完整覆盖（& | ^）
 * @note 正向用例：验证该特性编译通过的正确用法。
 */
function testIntBitwise(): void {
  let a: int = 0xFF; let b: int = 0x0F
  let andVal: int = a & b; let orVal: int = a | b; let xorVal: int = a ^ b
  console.log(andVal.toString(), orVal.toString(), xorVal.toString())
}
