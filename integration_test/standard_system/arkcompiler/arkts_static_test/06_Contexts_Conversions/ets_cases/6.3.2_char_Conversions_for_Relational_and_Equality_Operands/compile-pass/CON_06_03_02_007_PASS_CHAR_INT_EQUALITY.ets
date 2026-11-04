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
 * @id CON_06_03_02_007_PASS_CHAR_INT_EQUALITY
 * @expect compile-pass
 * @section 6.3.2
 * @design char == int / char != int: char widening 为 int 后判等
 * @note 正向用例：验证该特性编译通过的正确用法
 */
function testCharIntEquality(): void {
  let c: char = c'A'
  let i: int = 65
  let r1: boolean = c == i
  let r2: boolean = c != i
}
