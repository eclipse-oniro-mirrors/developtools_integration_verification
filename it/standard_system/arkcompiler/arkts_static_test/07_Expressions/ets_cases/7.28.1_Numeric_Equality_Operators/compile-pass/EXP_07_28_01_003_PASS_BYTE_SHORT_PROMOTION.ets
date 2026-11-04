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
 * @id EXP_07_28_01_003_PASS_BYTE_SHORT_PROMOTION
 * @expect compile-pass
 * @section 7.28.1
 * @design 验证 byte/short 类型通过加宽转换为 int 后等值比较编译通过
 *  * @note 正向用例：验证该特性编译通过的正确用法
 */
function main(): void {
  let b1: byte = 5;
  let b2: byte = 10;
  let s1: short = 5;
  let s2: short = 10;

  // byte == byte
  let r1: boolean = b1 == b2;
  // short == short
  let r2: boolean = s1 == s2;
  // byte == short (both promote to int)
  let r3: boolean = b1 == s1;
  // byte == int
  let r4: boolean = b1 == 5;
  // short == int
  let r5: boolean = s1 == 5;
  // byte != int
  let r6: boolean = b1 != 10;
}
