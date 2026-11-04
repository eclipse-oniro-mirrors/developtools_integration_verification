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
 * @id CON_06_04_04_004_PASS_STRING_ENUM_IN_RETURN
 * @expect compile-pass
 * @section 6.4.4
 * @design string 枚举在返回上下文中: return string-enum→string
 * @note 正向用例：string 枚举作返回值
 */
enum Tag { Open = 'open', Close = 'close' }

function retEnumAsString(): string { let e: Tag = Tag.Open; return e }
function retEnumAsUnion(): string | int { let e: Tag = Tag.Close; return e }

function testStringEnumInReturn(): void {
  let s: string = retEnumAsString()
  let u: string | int = retEnumAsUnion()
}
