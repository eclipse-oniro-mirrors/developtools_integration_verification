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
 * @id CON_06_04_014_FAIL_NUMERIC_ENUM_IN_STRING
 * @expect compile-fail
 * @section 6.4
 * @design 数值枚举直接赋给 string（非 string context），无隐式转换，应编译失败
 * @note 反向用例：数值枚举→string 无隐式转换（非 string operator context）
 */
enum Code {
  A,
  B
}

function testNumericEnumInStringFail(): void {
  let s: string = Code.A
}
