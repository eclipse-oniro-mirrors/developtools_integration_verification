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
 * @id CON_06_04_03_004_PASS_DOUBLE_ENUM_TO_DOUBLE
 * @expect compile-pass
 * @section 6.4.3
 * @design double 基类型枚举→double: DoubleEnum→double 同基类型
 * @note 正向用例：与 spec 的双精度枚举示例一致
 */
enum DoubleEnum: double { a = 1.0, b = 2.0, c = 3.14 }

function testDoubleEnumToDouble(): void {
  let e: DoubleEnum = DoubleEnum.a
  let v: double = e
}
