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
 * @id STMT_08_02_020_PASS_AUTO_SEMI
 * @expect compile-pass
 * @section 8.2
 * @design 表达式语句缺少分号时由编译器自动补全，编译通过
 * @note spec §8.2：A missing semicolon is added automatically to an expression used as a statement（与 Extended Conditional 无关）
 */
function testNoSemiFail(): void {
  let x: int = 5
  x + 1
  console.log(x.toString())
}
