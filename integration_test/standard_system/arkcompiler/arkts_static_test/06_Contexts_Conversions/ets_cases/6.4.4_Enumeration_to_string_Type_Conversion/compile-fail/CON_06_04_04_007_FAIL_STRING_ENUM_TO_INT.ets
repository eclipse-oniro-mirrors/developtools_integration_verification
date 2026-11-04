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
 * @id CON_06_04_04_007_FAIL_STRING_ENUM_TO_INT
 * @expect compile-fail
 * @section 6.4.4
 * @design string 基类型枚举→int: 这是 Enumeration to Numeric 的方向，不成立
 * @note 反向用例：string 枚举不能转为 int
 */
enum StrEnum { X = 'x', Y = 'y' }

function testStringEnumToIntFail(): void {
  let e: StrEnum = StrEnum.X
  let v: int = e
}
