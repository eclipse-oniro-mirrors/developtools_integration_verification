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
 * @id CON_06_04_03_006_PASS_ENUM_TO_UNION
 * @expect compile-pass
 * @section 6.4.3
 * @design 枚举→联合类型: int-enum→int|long (int相等, long更大)
 * @note 正向用例：枚举转换为含基类型的联合
 */
enum E1 { One, Two, Three }

function testEnumToUnion(): void {
  let e: E1 = E1.Two
  let u: int | long = e
}
