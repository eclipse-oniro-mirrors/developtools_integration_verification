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
 * @id CON_06_04_03_008_PASS_ENUM_IN_RETURN
 * @expect compile-pass
 * @section 6.4.3
 * @design 枚举在返回上下文中: return enum→int/long/double
 * @note 正向用例：枚举作为返回值的转换
 */
enum E3 { X, Y, Z }

function retEnumAsInt(): int { let e: E3 = E3.Y; return e }
function retEnumAsLong(): long { let e: E3 = E3.Z; return e }
function retEnumAsDouble(): double { let e: E3 = E3.X; return e }

function testEnumInReturn(): void {
  let a: int = retEnumAsInt()
  let b: long = retEnumAsLong()
  let c: double = retEnumAsDouble()
}
