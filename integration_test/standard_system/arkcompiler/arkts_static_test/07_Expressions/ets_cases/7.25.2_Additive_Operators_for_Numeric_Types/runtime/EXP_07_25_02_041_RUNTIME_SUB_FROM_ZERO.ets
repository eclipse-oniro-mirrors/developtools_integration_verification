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
 * @id EXP_07_25_02_041_RUNTIME_SUB_FROM_ZERO
 * @expect runtime
 * @section 7.25.2
 * @design 验证零减法的特殊规则：
 *         - 整数：0-x = -x（与取反相同）
 *         - 浮点：0.0 - (+0.0) = +0.0，但 -(+0.0) = -0.0（两者不同）
 *         spec：整数从零减等于取反；浮点从零减与取反不同。
 * @note 运行时用例：零减法规则
 */
function main(): void {
  // int: 0 - x = -x
  let a: int = 42
  let sub1: int = 0 - a
  let neg1: int = -a
  if (sub1 != neg1) {
    throw new Error('int: 0-42(' + sub1 + ') != -42(' + neg1 + ')')
  }

  let b: int = -17
  let sub2: int = 0 - b
  let neg2: int = -b
  if (sub2 != neg2) {
    throw new Error('int: 0-(-17)(' + sub2 + ') != -(-17)(' + neg2 + ')')
  }

  // float: 0.0 - (+0.0) = +0.0
  let posZero: double = 0.0
  let r1: double = 0.0 - posZero
  if (r1 != 0.0) {
    throw new Error('0.0 - 0.0 should be 0.0, got ' + r1)
  }

  // 验证 r1 是 +0.0 (1/r1 = +Infinity)
  let checkPos: double = 1.0 / r1
  let posInf: double = 1.0 / 0.0
  if (checkPos != posInf) {
    throw new Error('0.0-0.0 should be +0.0 (1/result=+Inf), got 1/' + r1 + '=' + checkPos)
  }

  // -0.0 (negation of +0.0 gives -0.0)
  let negZero: double = -posZero
  // 验证 negZero 是 -0.0 (1/negZero = -Infinity)
  let checkNeg: double = 1.0 / negZero
  let negInf: double = -1.0 / 0.0
  if (checkNeg != negInf) {
    throw new Error('-0.0 should be -0.0 (1/result=-Inf), got 1/' + negZero + '=' + checkNeg)
  }

  // long: 0 - x = -x
  let c: long = 99999999999
  let sub3: long = 0 - c
  let neg3: long = -c
  if (sub3 != neg3) {
    throw new Error('long: 0-99999999999(' + sub3 + ') != -99999999999(' + neg3 + ')')
  }
console.log('verified')
}
main()
