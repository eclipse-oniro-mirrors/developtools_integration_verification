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
 * @id CON_06_05_013_RUNTIME_INT_TO_BYTE
 * @expect runtime
 * @section 6.5
 * @design int.toByte() 低位截断: 保留低8位，符号可能改变
 * @note 运行时用例：验证 int→byte 的位截断
 */
function main(): void {
  let i1: int = 100
  if (i1.toByte() != 100) {
      throw new Error('100.toByte() should be 100')
    }

  let i2: int = 255
  if (i2.toByte() != -1) {
      throw new Error('255.toByte() should be -1 (overflow to -1)')
    }

  let i3: int = 128
  if (i3.toByte() != -128) {
      throw new Error('128.toByte() should be -128')
    }

  let i4: int = 0
  if (i4.toByte() != 0) {
      throw new Error('0.toByte() should be 0')
    }

  console.log('Int to byte truncation verified')
}
