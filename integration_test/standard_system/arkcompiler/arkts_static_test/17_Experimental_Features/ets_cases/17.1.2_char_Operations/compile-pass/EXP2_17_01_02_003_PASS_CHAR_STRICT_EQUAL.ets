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
 * @id EXP2_17_01_02_003_PASS_CHAR_STRICT_EQUAL
 * @expect compile-pass
 * @section 17.1.2
 * @design char 严格相等运算：验证 char === char 操作符
 * @note 正向用例：验证该特性编译通过的正确用法
 */
function testCharStrictEqual(): void {
  let c1: char = c'X'
  let c2: char = c'X'
  let strict_eq: boolean = c1 === c2
  console.log(strict_eq)
}
