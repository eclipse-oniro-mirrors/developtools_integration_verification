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
 * @id CON_06_04_012_FAIL_STRING_ENUM_IN_NUMERIC
 * @expect compile-fail
 * @section 6.4
 * @design string 值枚举不应有 Enumeration to Numeric 转换，用于算术应编译失败
 * @note 反向用例：string 枚举无 numeric 隐式转换，用于数值运算应失败
 */
enum Color {
  Red = 'red',
  Blue = 'blue'
}

function testStringEnumInNumericFail(): void {
  let r: int = Color.Red + 1
}
