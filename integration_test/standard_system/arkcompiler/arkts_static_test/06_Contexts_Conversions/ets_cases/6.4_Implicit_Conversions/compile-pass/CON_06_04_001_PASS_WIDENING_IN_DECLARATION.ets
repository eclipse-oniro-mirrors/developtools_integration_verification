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
 * @id CON_06_04_001_PASS_WIDENING_IN_DECLARATION
 * @expect compile-pass
 * @section 6.4
 * @design Widening Numeric Conversion 在声明上下文中：int→number, int→long, byte→int
 * @note 正向用例：验证 widening 在赋值上下文中隐式生效
 */
function testWideningInDeclaration(): void {
  let a: int = 42
  let b: number = a
  let c: long = a
  let d: int = a

  let e: byte = 10
  let f: short = e
  let g: int = e
  let h: long = e
}
