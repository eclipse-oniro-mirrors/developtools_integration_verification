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
 * @id EXP_07_36_001_PASS_CONST_LITERAL
 * @expect compile-pass
 * @section 7.36
 * @design 常量表达式：字面量
 * @note 正向用例：验证该特性编译通过的正确用法。
 */
const C1: int = 42
const C2: string = 'hello'
const C3: boolean = true
function testConstLiteral(): void {
  console.log(C1.toString(), C2, C3.toString())
}
