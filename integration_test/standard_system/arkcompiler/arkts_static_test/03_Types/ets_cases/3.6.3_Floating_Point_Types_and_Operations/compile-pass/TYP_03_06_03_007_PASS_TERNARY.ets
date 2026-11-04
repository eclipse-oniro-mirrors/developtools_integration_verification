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
 * @id TYP_03_06_03_007_PASS_TERNARY
 * @expect compile-pass
 * @section 3.6.3
 * @design 浮点三元 ?:
 * @note 正向用例：三元用于浮点
 */
function testTernary(): void {
  let a: double = 3.14
  let b: double = 2.71

  let max: double = a > b ? a : b
  let min: double = a < b ? a : b
  let abs: double = a < 0.0 ? -a : a

  // float 与 double 混合 ?: → double
  let f: float = 1.0f
  let r: double = a > 0.0 ? a : f
}