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
 * @id CON_06_05_023_RUNTIME_INT_TO_SHORT
 * @expect runtime
 * @section 6.5
 * @design int.toShort() 截断到16位
 * @note spec: integer casting discards all bits except N lowest
 */
function main(): void {
  let i1: int = 0x7FFF
  if (i1.toShort() != 32767) {
    throw new Error('0x7FFF->short failed')
  }
  let i2: int = 0x10000
  if (i2.toShort() != 0) {
    throw new Error('0x10000->short should be 0')
  }
  let i3: int = -1
  if (i3.toShort() != -1) {
    throw new Error('-1->short should be -1')
  }
  console.log('int to short verified')
}