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
 * @id EXP2_17_03_024_RUNTIME_CONSTRUCTOR_VALUES
 * @expect runtime
 * @section 17.3
 * @design 运行时验证构造函数创建的 ValueArray 元素值和 length 正确
 * @note 运行时用例：实际执行验证 new ValueT[](len, elem) 的正确性
 */
function main(): void {
  let a: Valueint[] = new Valueint[](5, 0)
  if (!(a.length == 5)) {
    throw new Error('assertion failed: length should equal 5')
  }
  // All elements should be 0
  if (!(a[0] == 0)) {
    throw new Error('assertion failed: a[0] should equal 0')
  }
  if (!(a[1] == 0)) {
    throw new Error('assertion failed: a[1] should equal 0')
  }
  if (!(a[2] == 0)) {
    throw new Error('assertion failed: a[2] should equal 0')
  }
  if (!(a[3] == 0)) {
    throw new Error('assertion failed: a[3] should equal 0')
  }
  if (!(a[4] == 0)) {
    throw new Error('assertion failed: a[4] should equal 0')
  }

  let b: Valuedouble[] = new Valuedouble[](3, 7.)
  if (!(b.length == 3)) {
    throw new Error('assertion failed: b.length should equal 3')
  }
  // All elements should be 7.0
  if (!(b[0] == 7.)) {
    throw new Error('assertion failed: b[0] should equal 7.0')
  }
  if (!(b[1] == 7.)) {
    throw new Error('assertion failed: b[1] should equal 7.0')
  }
  if (!(b[2] == 7.)) {
    throw new Error('assertion failed: b[2] should equal 7.0')
  }

  // Verify elements can be independently mutated
  b[1] = 42.0
  if (!(b[1] == 42.0)) {
    throw new Error('assertion failed: b[1] should equal 42.0 after mutation')
  }
  if (!(b[0] == 7.)) {
    throw new Error('assertion failed: b[0] should remain 7.0')
  }
  if (!(b[2] == 7.)) {
    throw new Error('assertion failed: b[2] should remain 7.0')
  }

  console.log('verified')
}
