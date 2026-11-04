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
 * @id EXP_07_29_02_004_FAIL_BOOLEAN_NUMERIC_MIXED
 * @expect compile-fail
 * @section 7.29.2
 * @design 验证 boolean 与 int/float/long 等数值类型混合使用 &、^、| 运算符时产生编译时错误
 * @note 反向用例：boolean &/^/| 运算符仅适用于 boolean 类型，与数值类型混用应报编译错误
 */
function main(): void {
  let b: boolean = true;
  let i: int = 1;
  let f: float = 1.0;
  let l: long = 1;

  // boolean & int — 编译时错误
  let r1: boolean = b & i;

  // boolean ^ float — 编译时错误
  let r2: boolean = b ^ f;

  // boolean | long — 编译时错误
  let r3: boolean = b | l;
}
