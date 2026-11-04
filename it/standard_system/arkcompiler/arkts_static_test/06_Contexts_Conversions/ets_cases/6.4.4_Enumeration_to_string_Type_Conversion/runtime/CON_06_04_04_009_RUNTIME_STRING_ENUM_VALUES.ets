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
 * @id CON_06_04_04_009_RUNTIME_STRING_ENUM_VALUES
 * @expect runtime
 * @section 6.4.4
 * @design string 枚举→string/union 运行时值保留
 * @note 运行时用例：验证转换后的字符串值与枚举定义一致
 */
enum StringEnum { a = 'a', b = 'b', c = 'c' }

function main(): void {
  let e: StringEnum = StringEnum.a
  let s: string = e
  if (s != 'a') {
    throw new Error('assertion: 'a' expected, got '' + s + ''')
  }

  let u: string | number = StringEnum.b
  if (u != 'b') {
    throw new Error('assertion: union 'b' expected')
  }

  let e2: StringEnum = StringEnum.c
  let s2: string = e2
  if (s2 != 'c') {
    throw new Error('assertion: 'c' expected')
  }

  console.log('String enum values verified')
}
