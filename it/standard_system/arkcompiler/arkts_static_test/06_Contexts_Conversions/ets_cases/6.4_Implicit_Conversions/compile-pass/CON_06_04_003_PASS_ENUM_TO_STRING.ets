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
 * @id CON_06_04_003_PASS_ENUM_TO_STRING
 * @expect compile-pass
 * @section 6.4
 * @design Enumeration to string Type Conversion: string 值枚举在 string 上下文中隐式转换
 * @note 正向用例：验证 string 枚举到 string 的隐式转换
 */
enum Label {
  Start = 'start',
  Stop = 'stop'
}

function testEnumToString(): void {
  let s1: string = 'status: ' + Label.Start
  let s2: string = Label.Stop + ' pressed'
}
