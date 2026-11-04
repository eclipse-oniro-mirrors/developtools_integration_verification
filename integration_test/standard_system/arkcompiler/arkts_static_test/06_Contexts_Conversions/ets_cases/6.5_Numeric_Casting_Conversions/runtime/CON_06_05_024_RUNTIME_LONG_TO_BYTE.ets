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
 * @id CON_06_05_024_RUNTIME_LONG_TO_BYTE
 * @expect runtime
 * @section 6.5
 * @design long.toByte() 截断到8位
 * @note spec: integer casting discards all bits except N lowest
 */
function main(): void {
  let l1: long = 255
  if (l1.toByte() != -1) {
    throw new Error('255L->byte should be -1')
  }
  let l2: long = 256
  if (l2.toByte() != 0) {
    throw new Error('256L->byte should be 0')
  }
  let l3: long = 127
  if (l3.toByte() != 127) {
    throw new Error('127L->byte failed')
  }
  console.log('long to byte verified')
}