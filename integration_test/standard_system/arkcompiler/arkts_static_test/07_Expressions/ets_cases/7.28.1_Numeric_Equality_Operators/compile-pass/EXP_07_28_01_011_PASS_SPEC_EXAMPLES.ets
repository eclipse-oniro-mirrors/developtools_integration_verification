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
 * @id EXP_07_28_01_011_PASS_SPEC_EXAMPLES
 * @expect compile-pass
 * @section 7.28.1
 * @design 验证 spec 代码示例中的等值比较编译通过
 *  * @note 正向用例：验证该特性编译通过的正确用法
 */
function main(): void {
  // spec example 1-3: 5 == 5 // true
  let r1: boolean = 5 == 5;
  // spec example: 5 != 5 // false
  let r2: boolean = 5 != 5;
  // spec example: 5 === 5 // true
  let r3: boolean = 5 === 5;
  // spec example: 5 == Number(5) // true
  let r4: boolean = 5 == Number(5);
  // spec example: 5 === Number(5) // true
  let r5: boolean = 5 === Number(5);
  // spec example: 5 == 5.0 // true
  let r6: boolean = 5 == 5.0;
}
