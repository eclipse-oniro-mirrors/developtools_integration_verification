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
 * @id LEX_02_01_018_PASS_CHAR_RELATIONAL_OP
 * @expect compile-pass
 * @section 2.1
 * @design char 关系运算符符合 spec/experimental.md 规定，编译器支持
 * @note spec/experimental.md 明确允许 char 关系运算符（spec 权威高于 cookbook）
 *       编译器行为与 spec 一致
 */
function testCharRelationalOp(): void {
  let a: char = c'A'
  let b: char = c'B'
  let result: boolean = a < b
}
