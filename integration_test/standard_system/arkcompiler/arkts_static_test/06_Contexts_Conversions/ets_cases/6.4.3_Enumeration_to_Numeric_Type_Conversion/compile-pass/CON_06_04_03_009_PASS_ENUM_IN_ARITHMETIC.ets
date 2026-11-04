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
 * @id CON_06_04_03_009_PASS_ENUM_IN_ARITHMETIC
 * @expect compile-pass
 * @section 6.4.3
 * @design 枚举在数值运算中: enum + int, enum * int
 * @note 正向用例：枚举值参与算术运算的转换
 */
enum Count { Zero, One, Two, Three }

function testEnumInArithmetic(): void {
  let r1: int = Count.One + 5
  let r2: int = Count.Two * 3
  let r3: int = 10 - Count.Zero
}
