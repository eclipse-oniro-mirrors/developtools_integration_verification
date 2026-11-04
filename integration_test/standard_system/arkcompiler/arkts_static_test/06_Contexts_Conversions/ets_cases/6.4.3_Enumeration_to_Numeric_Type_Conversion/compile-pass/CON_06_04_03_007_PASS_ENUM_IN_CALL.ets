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
 * @id CON_06_04_03_007_PASS_ENUM_IN_CALL
 * @expect compile-pass
 * @section 6.4.3
 * @design 枚举在调用上下文中: 枚举实参→int/long/double 形参
 * @note 正向用例：枚举作为函数实参的转换
 */
function takeInt(v: int): void {}
function takeLong(v: long): void {}
function takeDouble(v: double): void {}

enum E2 { A, B, C }

function testEnumInCall(): void {
  let e: E2 = E2.B
  takeInt(e)
  takeLong(e)
  takeDouble(e)
}
