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
 * @id EXP_07_28_01_007_PASS_MIXED_NUMERIC
 * @expect compile-pass
 * @section 7.28.1
 * @design 验证混合数值类型（int+long, int+float, int+double 等）等值比较编译通过
 *  * @note 正向用例：验证该特性编译通过的正确用法
 */
function main(): void {
  let i: int = 5;
  let l: long = 5;
  let f: float = 5.0f;
  let d: double = 5.0;

  // int == long
  let r1: boolean = i == l;
  // int == float
  let r2: boolean = i == f;
  // int == double
  let r3: boolean = i == d;
  // long == float
  let r4: boolean = l == f;
  // long == double
  let r5: boolean = l == d;
  // float == double
  let r6: boolean = f == d;

  // != 混合
  let r7: boolean = i != l;
  let r8: boolean = f != d;
}
