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
 * @id TYP_03_06_01_005_PASS_WIDENING_INT_LONG_FLOAT
 * @expect compile-pass
 * @section 3.6.1
 * @design int → long/float/double, long → float/double, float → double
 * @note 正向用例：层次中部各类型 widening
 */
function testWideningIntLongFloat(): void {
  let i: int = 100000
  let l: long = i
  let f1: float = i
  let d1: double = i

  let l2: long = 1000000000
  let f2: float = l2
  let d2: double = l2

  let f3: float = 3.14f
  let d3: double = f3
}