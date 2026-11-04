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
 * @id TYP_03_06_03_009_PASS_FLOAT_TO_INT_CAST
 * @expect compile-pass
 * @section 3.6.3
 * @design 浮点 cast 到整数 round-toward-zero（截断）
 * @note 正向用例：浮点显式转整数（用 stdlib 方法，因 as 弃用）
 */
function testFloatToIntCast(): void {
  let d: double = 3.7
  // ArkTS 弃用 as 用于数值类型，必须用 stdlib 方法
  let i: int = d.toInt()
  let l: long = d.toLong()

  let f: float = 2.9f
  let i2: int = f.toInt()

  // 负数截断 round-toward-zero
  let neg: double = -3.7
  let n: int = neg.toInt()
}