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
 * @id EXP_07_29_02_003_PASS_BOOLEAN_CHAINED
 * @expect compile-pass
 * @section 7.29.2
 * @design 验证 boolean 逻辑运算符的链式运算、括号分组及结果类型为 boolean
 * @note 正向用例：验证链式 boolean &、^、| 运算的正确编译及结果类型
 */
function main(): void {
  let a: boolean = true;
  let b: boolean = false;
  let c: boolean = true;

  // 链式运算
  let ch1: boolean = a & b | c;       // (true & false) | true = true
  let ch2: boolean = a ^ b & c;       // true ^ (false & true) = true ^ false = true

  // 括号分组
  let p1: boolean = (a & b) | c;      // false | true = true
  let p2: boolean = a & (b | c);      // true & (false | true) = true & true = true
  let p3: boolean = (a ^ b) ^ c;      // true ^ true = false

  // 混合链式
  let mx1: boolean = a & true | false ^ b;  // (true & true) | (false ^ false) = true | false = true
  let mx2: boolean = false | false ^ a & true;  // (false | false) ^ (true & true) = false ^ true = true

  // 结果类型验证（boolean 类型正确赋值）
  let resType: boolean = a & b;

  // 自身运算
  let selfAnd: boolean = a & a;        // true
  let selfXor: boolean = a ^ a;        // false
  let selfOr: boolean = a | a;         // true
}
