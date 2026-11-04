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
 * @id EXP_07_27_01_006_PASS_MIXED_NUMERIC
 * @expect compile-pass
 * @section 7.27.1
 * @design 验证混合数值类型在关系比较中的编译通过（int+long、int+float、int+double、long+float、long+double、float+double）
 *  * @note 正向用例：验证该特性编译通过的正确用法
 */
function main(): void {
  let a: int = 5;
  let b: long = 10;
  let c: float = 5.5f;
  let d: double = 10.5;

  // int < long
  let r1: boolean = a < b;
  // int < float
  let r2: boolean = a < c;
  // int < double
  let r3: boolean = a < d;
  // long < float
  let r4: boolean = b < c;
  // long < double
  let r5: boolean = b < d;
  // float < double
  let r6: boolean = c < d;

  // 混合链式
  let r7: boolean = a < b && c < d;
  // int 字面量与 long 变量
  let r8: boolean = -1 < b;
}
