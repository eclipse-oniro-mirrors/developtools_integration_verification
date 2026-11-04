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
 * @id CON_06_03_02_014_FAIL_CHAR_BOOL_RELATIONAL
 * @expect compile-fail
 * @section 6.3.2
 * @design char < boolean: boolean 非数值类型，char widening 不适用，应编译失败
 * @note 反向用例：非数值类型作另一操作数时 char 转换不适用
 */
function testCharBoolRelationalFail(): void {
  let c: char = c'X'
  let b: boolean = true
  let r: boolean = c < b
}
