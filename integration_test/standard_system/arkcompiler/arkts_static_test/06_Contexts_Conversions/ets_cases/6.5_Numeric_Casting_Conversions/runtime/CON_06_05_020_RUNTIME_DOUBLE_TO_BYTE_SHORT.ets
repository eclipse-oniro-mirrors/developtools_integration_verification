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
 * @id CON_06_05_020_RUNTIME_DOUBLE_TO_BYTE_SHORT
 * @expect runtime
 * @section 6.5
 * @design double→byte/short 两步转换
 * @note spec: double→int→byte/short
 */
function main(): void {
  let d: double = 257.7
  let b: byte = d.toInt().toByte()
  if (b != 1) {
    throw new Error('257.7->int->byte should be 1 (257 mod 256)')
  let s: short = d.toInt().toShort()
  if (s != 257) {
    throw new Error('257.7->int->short should be 257')
  console.log('double to byte/short verified')
}