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
 * @id STMT_08_02_025_PASS_STRING_CONCAT
 * @expect compile-pass
 * @section 8.2
 * @design string + int 为合法字符串拼接表达式，作为语句结果丢弃，编译通过
 * @note spec 字符串拼接：+ 运算符对 string 与数值执行拼接，表达式作为语句合法（与 Extended Conditional 无关）
 */
function testBinaryInvalidFail(): void {
  let x: string = "hello"
  x + 5
  console.log(x)
}
