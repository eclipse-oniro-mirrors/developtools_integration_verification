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
 * @id CON_06_04_04_002_PASS_STRING_ENUM_TO_UNION
 * @expect compile-pass
 * @section 6.4.4
 * @design string 基类型枚举→string|number 联合类型
 * @note 正向用例：与 spec 示例一致
 */
enum StringEnum { a = 'a', b = 'b', c = 'c' }

function testStringEnumToUnion(): void {
  let e: StringEnum = StringEnum.a
  let u: string | number = e
}
