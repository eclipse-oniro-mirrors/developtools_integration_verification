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
 * @id CON_06_04_002_PASS_ENUM_TO_NUMERIC
 * @expect compile-pass
 * @section 6.4
 * @design Enumeration to Numeric Type Conversion: 数值枚举在数值上下文中隐式转换
 * @note 正向用例：验证枚举到数值的隐式转换
 */
enum Count {
  Zero,
  One,
  Two
}

function testEnumToNumeric(): void {
  let a: int = Count.One
  let b: long = Count.Two
  let c: double = Count.Zero

  let d: int = 5 + Count.One
}
