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
 * @id CON_06_03_01_022_RUNTIME_NEGATIVE_COMPARISON
 * @expect runtime
 * @section 6.3.1
 * @design 负数值在 widening 关系比较中的运行时行为
 * @note 运行时用例：实际执行验证负值的 widening 比较正确性
 */
function main(): void {
  let a: int = -10
  let b: long = -5

  if (!(a < b)) {
    throw new Error('assertion failed: -10 < -5 should be true')
  }
  if (a > b) {
    throw new Error('assertion failed: -10 > -5 should be false')
  }

  let c: int = -5
  let d: long = -10
  if (!(c > d)) {
    throw new Error('assertion failed: -5 > -10 should be true')
  }

  let e: int = -3
  let f: double = -3.0
  if (!(e >= f)) {
    throw new Error('assertion failed: -3 >= -3.0 should be true')
  }

  console.log('Negative value comparison verified')
}
