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
 * @id EXP2_17_01_01_014_RUNTIME_UNICODE_VALUE_VERIFY
 * @expect runtime
 * @section 17.1.1
 * @design Unicode 转义字面量值验证：验证 c'A' 等于 c'A'
 * @note 运行时用例：实际执行验证 Unicode 转义值与对应字符一致
 */
function main(): void {
  let uni0041: char = c'A'
  let ch_A: char = c'A'
  // c'A' should equal c'A'
  if (!(uni0041 == ch_A)) {
    throw new Error('assertion failed: c'\\u0041' should equal c'A'')
  }
  // c'u007F' should be DEL (127)
  let uni007F: char = c''
  if (!(uni007F == 127)) {
    throw new Error('assertion failed: c'\\u007F' should equal 127')
  }
  // c'u0061' should be 'a'
  let uni0061: char = c'a'
  if (!(uni0061 == 0x61)) {
    throw new Error('assertion failed: c'\\u0061' should equal 0x61')
  }
  console.log('verified')
}
