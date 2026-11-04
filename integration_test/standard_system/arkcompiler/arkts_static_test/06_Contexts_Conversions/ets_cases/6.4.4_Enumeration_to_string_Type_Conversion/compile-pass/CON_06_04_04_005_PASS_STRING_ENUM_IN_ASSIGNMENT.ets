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
 * @id CON_06_04_04_005_PASS_STRING_ENUM_IN_ASSIGNMENT
 * @expect compile-pass
 * @section 6.4.4
 * @design string 枚举在赋值上下文中: 变量赋值时转换
 * @note 正向用例：赋值语句中的 string enum 转换
 */
enum Mode { Read = 'read', Write = 'write' }

function testStringEnumInAssignment(): void {
  let s: string = 'init'
  let e: Mode = Mode.Read
  s = e

  let u: string | int = 0
  u = e
}
