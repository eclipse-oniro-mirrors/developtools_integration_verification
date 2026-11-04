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
 * @id EXP_07_25_02_023_FAIL_STRING_SUB
 * @expect compile-fail
 * @section 7.25.2
 * @design 验证 string - string 产生编译错误。
 *         spec：- 没有字符串拼接语义；string 不可转换为数值类型。
 * @note 反向用例：string - string 编译错误
 */
function main(): void {
  let s1: string = 'Hello'
  let s2: string = 'World'
  let r = s1 - s2  // error: string not convertible to numeric, and - has no string concat rule
}
main()
