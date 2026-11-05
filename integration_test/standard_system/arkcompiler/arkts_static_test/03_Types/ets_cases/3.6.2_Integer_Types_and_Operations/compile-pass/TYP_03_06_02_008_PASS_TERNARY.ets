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
 * @id TYP_03_06_02_008_PASS_TERNARY
 * @expect compile-pass
 * @section 3.6.2
 * @design 三元条件运算 ?:
 * @note 正向用例：整数 ?: 表达式
 */
function testTernary(): void {
  let a: int = 10
  let b: int = 20

  let max: int = a > b ? a : b
  let min: int = a < b ? a : b
  let abs: int = a < 0 ? -a : a

  let lo: long = 1000
  let lmax: long = a > b ? lo : 0
}