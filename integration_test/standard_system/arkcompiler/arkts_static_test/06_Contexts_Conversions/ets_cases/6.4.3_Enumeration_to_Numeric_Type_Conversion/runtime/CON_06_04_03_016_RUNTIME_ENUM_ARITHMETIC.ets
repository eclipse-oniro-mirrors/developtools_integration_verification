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
 * @id CON_06_04_03_016_RUNTIME_ENUM_ARITHMETIC
 * @expect runtime
 * @section 6.4.3
 * @design 枚举算术运算运行时验证
 * @note 运行时用例：验证枚举在算术中的正确行为
 */
enum Val { Ten = 10, Twenty = 20, Thirty = 30 }

function main(): void {
  let r1: int = Val.Ten + 5
  if (r1 != 15) {
    throw new Error('assertion: 10+5=15')
  }

  let r2: int = Val.Twenty * 2
  if (r2 != 40) {
    throw new Error('assertion: 20*2=40')
  }

  let r3: int = Val.Thirty - Val.Ten
  if (r3 != 20) {
    throw new Error('assertion: 30-10=20')
  }

  let r4: int = Val.Thirty / Val.Ten
  if (r4 != 3) {
    throw new Error('assertion: 30/10=3')
  }

  console.log('Enum arithmetic verified')
}
