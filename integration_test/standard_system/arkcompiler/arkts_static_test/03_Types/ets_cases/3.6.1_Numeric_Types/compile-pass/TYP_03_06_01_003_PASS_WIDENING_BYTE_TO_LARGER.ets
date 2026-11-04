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
 * @id TYP_03_06_01_003_PASS_WIDENING_BYTE_TO_LARGER
 * @expect compile-pass
 * @section 3.6.1
 * @design byte 隐式 widening 到 short/int/long/float/double
 * @note 正向用例：byte 可隐式转换为所有更大数值类型
 */
function testWideningByte(): void {
  let b: byte = 50

  let s: short = b
  let i: int = b
  let l: long = b
  let f: float = b
  let d: double = b
  let n: number = b
}