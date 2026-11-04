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
 * @id LEX_02_05_009_PASS_OP_ARITHMETIC
 * @expect compile-pass
 * @section 2.5
 * @design Operators Token: 算术运算符 + - * / %
 * @note 正向用例：算术运算符作为 Token
 */
function testOpArithmetic(): void {
  let a: int = 10 + 3
  let b: int = 10 - 3
  let c: int = 10 * 3
  let d: int = 10 / 3
  let e: int = 10 % 3
}
