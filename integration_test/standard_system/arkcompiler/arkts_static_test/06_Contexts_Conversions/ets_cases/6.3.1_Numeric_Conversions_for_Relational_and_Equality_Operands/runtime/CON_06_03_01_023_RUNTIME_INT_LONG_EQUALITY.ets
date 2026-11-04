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
 * @id CON_06_03_01_023_RUNTIME_INT_LONG_EQUALITY
 * @expect runtime
 * @section 6.3.1
 * @design int 与 long 的相等比较运行时行为：int widening 为 long 后判等
 * @note 运行时用例：实际执行验证 int == long 和 int != long 语义
 */
function main(): void {
  let a: int = 100
  let b: long = 100
  let c: long = 200

  if (!(a == b)) {
    throw new Error('assertion failed: 100 == 100 should be true')
  }
  if (a == c) {
    throw new Error('assertion failed: 100 == 200 should be false')
  }
  if (!(a != c)) {
    throw new Error('assertion failed: 100 != 200 should be true')
  }
  if (a != b) {
    throw new Error('assertion failed: 100 != 100 should be false')
  }

  console.log('Int-long equality comparison verified')
}
