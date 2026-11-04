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
 * @id TYP_03_06_03_010_PASS_INT_TO_FLOAT_WIDENING
 * @expect compile-pass
 * @section 3.6.3
 * @design 整数 widening 到浮点（隐式合法）
 * @note 正向用例：byte/short/int/long → float/double 隐式
 */
function testIntToFloatWidening(): void {
  let by: byte = 10
  let sh: short = 100
  let i: int = 1000
  let lo: long = 1000000

  let f1: float = by
  let f2: float = sh
  let f3: float = i
  let f4: float = lo

  let d1: double = by
  let d2: double = sh
  let d3: double = i
  let d4: double = lo

  // float widening 到 double
  let fl: float = 3.14f
  let dl: double = fl
}