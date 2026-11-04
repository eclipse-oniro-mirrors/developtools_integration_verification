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
 * @id EXP2_17_03_022_RUNTIME_ELEMENT_MUTATION
 * @expect runtime
 * @section 17.3
 * @design 运行时验证 ValueArray 元素可通过索引修改，且修改后值正确持久化
 * @note 运行时用例：实际执行验证元素可变性
 */
function main(): void {
  let a: Valueint[] = [1, 2, 3]
  // Verify initial values
  if (!(a[0] == 1)) {
    throw new Error('assertion failed: a[0] should equal 1 before mutation')
  }
  // Mutate element
  a[0] = 100
  if (!(a[0] == 100)) {
    throw new Error('assertion failed: a[0] should equal 100 after mutation')
  }
  // Verify other elements unaffected
  if (!(a[1] == 2)) {
    throw new Error('assertion failed: a[1] should remain 2')
  }
  if (!(a[2] == 3)) {
    throw new Error('assertion failed: a[2] should remain 3')
  }

  // Mutate another element
  a[1] = 200
  if (!(a[1] == 200)) {
    throw new Error('assertion failed: a[1] should equal 200 after mutation')
  }
  if (!(a[0] == 100)) {
    throw new Error('assertion failed: a[0] should remain 100')
  }

  // Test mutation on double array
  let b: Valuedouble[] = [1.0, 2.0]
  b[0] = 99.9
  if (!(b[0] == 99.9)) {
    throw new Error('assertion failed: b[0] should equal 99.9 after mutation')
  }

  console.log('verified')
}
