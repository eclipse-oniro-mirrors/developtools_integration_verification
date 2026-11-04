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
 * @id EXP_07_28_01_009_PASS_BIGINT_VS_NUMERIC
 * @expect compile-pass
 * @section 7.28.1
 * @design 验证 bigint 与数值类型等值比较（spec 要求结果 false，但不为编译时错误）
 *  * @note 正向用例：验证该特性编译通过的正确用法
 *       spec 规定："If one operand is of type bigint, and the other is of a numeric type, then the result is false."
 */
function main(): void {
  let bi: bigint = 5n;
  let i: int = 5;
  let l: long = 5;
  let f: float = 5.0f;
  let d: double = 5.0;

  // bigint == int → false (compile passes)
  let r1: boolean = bi == i;
  let r2: boolean = bi != i;
  // bigint == long → false
  let r3: boolean = bi == l;
  // bigint == float → false
  let r4: boolean = bi == f;
  // bigint == double → false
  let r5: boolean = bi == d;
  // bigint === numeric → false
  let r6: boolean = bi === i;
  let r7: boolean = bi !== i;
}
