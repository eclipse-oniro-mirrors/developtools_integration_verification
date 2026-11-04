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
 * @id CON_06_03_02_006_PASS_INT_CHAR_RELATIONAL
 * @expect compile-pass
 * @section 6.3.2
 * @design int < char: char widening 为 int (与 int 同类)，直接比较
 * @note 正向用例：验证该特性编译通过的正确用法
 */
function testIntCharRelational(): void {
  let i: int = 50
  let c: char = c'9'
  let r1: boolean = i < c
  let r2: boolean = i > c
}
