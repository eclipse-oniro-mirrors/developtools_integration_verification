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
 * @id EXP2_17_03_020_RUNTIME_ELEMENT_VALUES
 * @expect runtime
 * @section 17.3
 * @design 运行时验证 Valueint[] 字面量创建后元素值正确
 * @note 运行时用例：实际执行验证数组元素值与预期一致
 */
function main(): void {
  let a: Valueint[] = [10, 20, 30]
  if (!(a[0] == 10)) {
    throw new Error('assertion failed: a[0] should equal 10')
  }
  if (!(a[1] == 20)) {
    throw new Error('assertion failed: a[1] should equal 20')
  }
  if (!(a[2] == 30)) {
    throw new Error('assertion failed: a[2] should equal 30')
  }

  let b: Valuedouble[] = [1.5, 2.5, 3.5]
  if (!(b[0] == 1.5)) {
    throw new Error('assertion failed: b[0] should equal 1.5')
  }
  if (!(b[1] == 2.5)) {
    throw new Error('assertion failed: b[1] should equal 2.5')
  }
  if (!(b[2] == 3.5)) {
    throw new Error('assertion failed: b[2] should equal 3.5')
  }

  let c: Valueboolean[] = [true, false, true]
  if (!(c[0] == true)) {
    throw new Error('assertion failed: c[0] should equal true')
  }
  if (!(c[1] == false)) {
    throw new Error('assertion failed: c[1] should equal false')
  }
  if (!(c[2] == true)) {
    throw new Error('assertion failed: c[2] should equal true')
  }

  console.log('verified')
}
