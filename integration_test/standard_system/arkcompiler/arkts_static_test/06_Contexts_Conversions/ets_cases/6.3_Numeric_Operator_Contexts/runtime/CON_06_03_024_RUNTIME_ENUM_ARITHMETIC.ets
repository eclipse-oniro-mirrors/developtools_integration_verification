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
 * @id CON_06_03_024_RUNTIME_ENUM_ARITHMETIC
 * @expect runtime
 * @section 6.3
 * @design 数值枚举算术运算运行时行为: enum+int, enum*int, enum/int
 * @note 运行时用例：实际执行验证枚举算术结果
 */
enum Val {
  A = 10,
  B = 20,
  C = 30
}

function main(): void {
  let r1: int = Val.A + 5
  if (r1 != 15) {
    throw new Error('assertion failed: Val.A(10) + 5 should be 15, got ' + r1)
  }

  let r2: int = Val.B * 3
  if (r2 != 60) {
    throw new Error('assertion failed: Val.B(20) * 3 should be 60')
  }

  let r3: int = Val.C / Val.A
  if (r3 != 3) {
    throw new Error('assertion failed: 30 / 10 should be 3')
  }

  let r4: int = Val.C % Val.B
  if (r4 != 10) {
    throw new Error('assertion failed: 30 % 20 should be 10')
  }

  console.log('Enum arithmetic verified')
}
