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
 * @id EXP2_17_01_02_004_PASS_CHAR_EQ_INT
 * @expect compile-pass
 * @section 17.1.2
 * @design char 与 int 相等运算：验证 char == int 和 char != int（比较为数值类型的整数）
 * @note 正向用例：验证该特性编译通过的正确用法
 */
function testCharEqInt(): void {
  let c: char = c'A'
  let eq: boolean = c == 0x41
  let neq: boolean = c != 0x42
  console.log(eq)
  console.log(neq)
}
