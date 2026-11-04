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
 * @id CON_06_05_007_PASS_ALL_CONVERSION_METHODS
 * @expect compile-pass
 * @section 6.5
 * @design 全部 .toXxx() 方法: byte→short→int→long→float→double 及反向
 * @note 正向用例：覆盖全部标准库转换方法
 */
function processInt(v: int): void {}

function testAllConversionMethods(): void {
  let b: byte = 10
  let s: short = b.toShort()
  let i1: int = b.toInt()
  let l1: long = b.toLong()
  let d1: double = b.toDouble()

  let i2: int = 42
  let l2: long = i2.toLong()
  let d2: double = i2.toDouble()

  let d3: double = 3.14
  let i3: int = d3.toInt()
  let l3: long = d3.toLong()

  processInt(d3.toInt())
}
