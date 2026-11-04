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
 * @id TYP_03_06_03_011_FAIL_FLOAT_BOOLEAN_CONVERT
 * @expect compile-fail
 * @section 3.6.3
 * @design 浮点 ↔ boolean 互转禁止
 * @note 反向用例：spec §3.6.3 "Conversions between floating-point types and type boolean are not allowed"
 */
function testFloatBooleanConvertFail(): void {
  let d: double = 3.14
  let b: boolean = d

  let bl: boolean = true
  let f: float = bl

  // 算术混合
  let mix: double = d + bl
}