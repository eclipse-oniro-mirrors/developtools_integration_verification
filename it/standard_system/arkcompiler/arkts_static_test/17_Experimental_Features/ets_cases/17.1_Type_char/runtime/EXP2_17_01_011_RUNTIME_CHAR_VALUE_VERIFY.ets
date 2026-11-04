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
 * @id EXP2_17_01_011_RUNTIME_CHAR_VALUE_VERIFY
 * @expect runtime
 * @section 17.1
 * @design char 变量值验证：验证 char 字面量对应的 Unicode 码点值
 * @note 运行时用例：实际执行验证 char 值与整数的关系
 */
function main(): void {
  let ch: char = c'a'
  // As per spec, char can be compared with numeric types
  // c'a' should equal 0x61 (97)
  if (!(ch == 0x61)) {
    throw new Error('assertion failed: c'a' should equal 0x61')
  }
  let ch2: char = c'A'
  if (!(ch2 == 65)) {
    throw new Error('assertion failed: c'A' should equal 65')
  }
  console.log('verified')
}
