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
 * @id EXP_07_28_01_012_PASS_NAN_INF_ZERO
 * @expect compile-pass
 * @section 7.28.1
 * @design 验证浮点特殊值（NaN、Infinity、-0.0）在等值比较中编译通过
 *  * @note 正向用例：验证该特性编译通过的正确用法
 */
function main(): void {
  let nan: double = 0.0 / 0.0;
  let posInf: double = 1.0 / 0.0;
  let negInf: double = -1.0 / 0.0;
  let negZero: double = -0.0;
  let zero: double = 0.0;

  // NaN 比较（编译通过，运行时 false）
  let r1: boolean = nan == 1.0;
  let r2: boolean = nan != 1.0;
  let r3: boolean = nan == nan;
  let r4: boolean = nan != nan;

  // Infinity 比较
  let r5: boolean = posInf == posInf;
  let r6: boolean = posInf != negInf;
  let r7: boolean = negInf == negInf;

  // 零比较
  let r8: boolean = negZero == zero;
  let r9: boolean = zero != negZero;
}
