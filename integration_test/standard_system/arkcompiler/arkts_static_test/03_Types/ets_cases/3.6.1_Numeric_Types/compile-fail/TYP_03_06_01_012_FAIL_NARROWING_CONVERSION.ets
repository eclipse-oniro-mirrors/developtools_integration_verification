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
 * @id TYP_03_06_01_012_FAIL_NARROWING_CONVERSION
 * @expect compile-fail
 * @section 3.6.1
 * @design 数值类型层次中大类型不能隐式 narrowing 到小类型
 * @note 反向用例：spec §3.6.1 仅 widening 隐式合法
 */
function testNarrowingFail(): void {
  // double → float
  let d: double = 3.14
  let f: float = d

  // long → int
  let l: long = 100000
  let i: int = l

  // int → short
  let i2: int = 1000
  let s: short = i2

  // short → byte
  let s2: short = 100
  let b: byte = s2

  // float → long
  let f2: float = 1.0f
  let l2: long = f2
}