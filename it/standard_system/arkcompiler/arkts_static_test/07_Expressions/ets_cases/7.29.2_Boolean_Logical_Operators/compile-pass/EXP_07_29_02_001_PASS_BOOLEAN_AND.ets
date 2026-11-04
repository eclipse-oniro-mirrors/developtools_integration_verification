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
 * @id EXP_07_29_02_001_PASS_BOOLEAN_AND
 * @expect compile-pass
 * @section 7.29.2
 * @design 验证 boolean 类型 &（AND）运算符的编译通过：true & true、true & false、false & true、false & false 四种组合
 * @note 正向用例：验证 boolean & 运算符的正确编译，覆盖全部四种真值表组合
 */
function main(): void {
  let a: boolean = true;
  let b: boolean = false;

  // & 运算符四种真值表组合
  let r1: boolean = true & true;    // true
  let r2: boolean = true & false;   // false
  let r3: boolean = false & true;   // false
  let r4: boolean = false & false;  // false

  // 变量参与 & 运算
  let r5: boolean = a & true;       // true
  let r6: boolean = a & b;          // false
  let r7: boolean = b & a;          // false
  let r8: boolean = b & b;          // false
}
