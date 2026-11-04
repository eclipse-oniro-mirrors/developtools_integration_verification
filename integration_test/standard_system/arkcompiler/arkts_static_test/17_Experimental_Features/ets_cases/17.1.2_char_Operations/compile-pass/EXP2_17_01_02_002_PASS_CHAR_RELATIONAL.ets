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
 * @id EXP2_17_01_02_002_PASS_CHAR_RELATIONAL
 * @expect compile-pass
 * @section 17.1.2
 * @design char 与 char 关系运算：验证 char < char, char > char, char <= char, char >= char 操作符
 * @note 正向用例：验证该特性编译通过的正确用法
 */
function testCharRelational(): void {
  let c1: char = c'a'
  let c2: char = c'b'
  let lt: boolean = c1 < c2
  let gt: boolean = c2 > c1
  let le: boolean = c1 <= c2
  let ge: boolean = c2 >= c1
  // Also test same-value comparisons
  let c3: char = c'Z'
  let c4: char = c'Z'
  let le2: boolean = c3 <= c4
  let ge2: boolean = c3 >= c4
  console.log(lt)
  console.log(gt)
  console.log(le)
  console.log(ge)
  console.log(le2)
  console.log(ge2)
}
