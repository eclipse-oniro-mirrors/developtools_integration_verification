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
 * @id CON_06_03_01_027_RUNTIME_ALL_RELATIONAL_OPS
 * @expect runtime
 * @section 6.3.1
 * @design 全部六种关系/相等运算符在 int-long 混合中的运行时行为
 * @note 运行时用例：实际执行综合验证 < > <= >= == != 语义
 */
function main(): void {
  let a: int = 50
  let b: long = 100
  let c: long = 50

  if (!(a < b)) {
    throw new Error('assertion failed: 50 < 100 should be true')
  }
  if (a > b) {
    throw new Error('assertion failed: 50 > 100 should be false')
  }
  if (!(a <= b)) {
    throw new Error('assertion failed: 50 <= 100 should be true')
  }
  if (a >= b) {
    throw new Error('assertion failed: 50 >= 100 should be false')
  }
  if (a == b) {
    throw new Error('assertion failed: 50 == 100 should be false')
  }
  if (!(a != b)) {
    throw new Error('assertion failed: 50 != 100 should be true')
  }

  if (!(a == c)) {
    throw new Error('assertion failed: 50 == 50 should be true')
  }
  if (a != c) {
    throw new Error('assertion failed: 50 != 50 should be false')
  }

  console.log('All relational operators verified')
}
