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
 * @id CON_06_03_027_RUNTIME_ENUM_BITWISE_SHIFT
 * @expect runtime
 * @section 6.3
 * @design 枚举位运算/移位运行时行为: enum|int, enum<<int, ~enum
 * @note 运行时用例：实际执行验证枚举位运算和一元运算结果
 */
enum Flags {
  None = 0,
  Read = 1,
  Write = 2
}

function main(): void {
  let r1: int = Flags.Read | Flags.Write
  if (r1 != 3) {
    throw new Error('assertion failed: 1 | 2 should be 3')
  }

  let r2: int = 3 & Flags.Read
  if (r2 != 1) {
    throw new Error('assertion failed: 3 & 1 should be 1')
  }

  let r3: int = Flags.Write << 2
  if (r3 != 8) {
    throw new Error('assertion failed: 2 << 2 should be 8')
  }

  let r4: int = ~Flags.None
  if (r4 != -1) {
    throw new Error('assertion failed: ~0 should be -1')
  }

  console.log('Enum bitwise/shift verified')
}
