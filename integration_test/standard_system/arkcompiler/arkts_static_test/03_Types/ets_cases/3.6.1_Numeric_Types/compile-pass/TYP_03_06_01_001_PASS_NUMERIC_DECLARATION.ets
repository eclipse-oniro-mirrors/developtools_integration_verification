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
 * @id TYP_03_06_01_001_PASS_NUMERIC_DECLARATION
 * @expect compile-pass
 * @section 3.6.1
 * @design 6 种数值类型基本声明
 * @note 正向用例：byte/short/int/long/float/double 声明
 */
function testNumericDeclaration(): void {
  let b: byte = 100
  let s: short = 1000
  let i: int = 100000
  let l: long = 10000000000
  let f: float = 3.14f
  let d: double = 3.14
  let n: number = 3.14   // number 是 double 别名
}