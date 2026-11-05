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
 * @id EXP_07_27_01_005_PASS_BYTE_SHORT_PROMOTION
 * @expect compile-pass
 * @section 7.27.1
 * @design 验证 byte/short 类型在数值关系比较中自动提升为 int 后编译通过
 *  * @note 正向用例：验证该特性编译通过的正确用法
 */
function main(): void {
  let a: byte = 5;
  let b: byte = 10;
  let c: short = 5;
  let d: short = 10;

  // byte 与 byte
  let r1: boolean = a < b;
  // short 与 short
  let r2: boolean = c <= d;
  // byte 与 short
  let r3: boolean = a > c;
  // byte 与 int 字面量
  let r4: boolean = a >= 5;
  // short 与 int
  let r5: boolean = -1 as short < 0;
  // byte 与 short 混合链式
  let r6: boolean = a < c && d > b;
}
