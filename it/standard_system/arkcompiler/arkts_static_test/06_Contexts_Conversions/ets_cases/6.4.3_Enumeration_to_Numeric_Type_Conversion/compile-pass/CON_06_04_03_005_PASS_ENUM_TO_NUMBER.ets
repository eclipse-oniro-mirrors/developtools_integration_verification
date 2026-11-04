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
 * @id CON_06_04_03_005_PASS_ENUM_TO_NUMBER
 * @expect compile-pass
 * @section 6.4.3
 * @design int 基类型枚举→number (更大类型)
 * @note 正向用例：与 spec 的 number_value 示例一致
 */
enum NumEnum { P, Q, R }

function testEnumToNumber(): void {
  let e: NumEnum = NumEnum.Q
  let v: number = e
}
