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
 * @id CON_06_04_03_010_FAIL_INT_ENUM_TO_BYTE
 * @expect compile-fail
 * @section 6.4.3
 * @design int 基类型枚举→byte (更小类型), 应编译失败
 * @note 反向用例：枚举只能转换为 ≥ 基类型的数值类型
 */
enum E { A, B, C }

function testIntEnumToByteFail(): void {
  let e: E = E.B
  let v: byte = e
}
