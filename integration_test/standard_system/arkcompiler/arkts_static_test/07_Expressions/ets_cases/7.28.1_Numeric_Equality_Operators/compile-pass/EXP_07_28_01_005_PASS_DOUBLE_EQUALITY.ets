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
 * @id EXP_07_28_01_005_PASS_DOUBLE_EQUALITY
 * @expect compile-pass
 * @section 7.28.1
 * @design 验证 double 类型的 ==, != 等值运算符编译通过
 *  * @note 正向用例：验证该特性编译通过的正确用法
 */
function main(): void {
  let a: double = 1.0;
  let b: double = 2.0;
  let r1: boolean = a == b;
  let r2: boolean = a != b;

  // double 特殊值
  let nan: double = 0.0 / 0.0;
  let r3: boolean = nan == 1.0;
  let r4: boolean = nan != nan;

  let inf: double = 1.0 / 0.0;
  let negInf: double = -1.0 / 0.0;
  let r5: boolean = inf == inf;
  let r6: boolean = inf != negInf;

  let negZero: double = -0.0;
  let zero: double = 0.0;
  let r7: boolean = negZero == zero;

  // spec 示例：整数与浮点比较
  let r8: boolean = 5 == 5.0;
}
