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
 * @id CON_06_03_01_019_RUNTIME_INT_LONG_COMPARISON
 * @expect runtime
 * @section 6.3.1
 * @design int 与 long 的关系比较运行时行为：int widening 为 long 后比较
 * @note 运行时用例：实际执行验证 int < long 的语义正确性
 */
function main(): void {
  let a: int = 10
  let b: long = 20

  if (!(a < b)) {
    throw new Error('assertion failed: 10 < 20 should be true')
  }
  if (a > b) {
    throw new Error('assertion failed: 10 > 20 should be false')
  }
  if (!(a <= b)) {
    throw new Error('assertion failed: 10 <= 20 should be true')
  }

  let c: int = 30
  if (!(c > b)) {
    throw new Error('assertion failed: 30 > 20 should be true')
  }

  console.log('Int-long relational comparison verified')
}
