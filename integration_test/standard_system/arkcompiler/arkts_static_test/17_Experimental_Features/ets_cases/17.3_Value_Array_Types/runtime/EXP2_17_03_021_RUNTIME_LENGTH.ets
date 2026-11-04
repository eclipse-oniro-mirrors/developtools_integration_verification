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
 * @id EXP2_17_03_021_RUNTIME_LENGTH
 * @expect runtime
 * @section 17.3
 * @design 运行时验证 ValueArray 的 length 属性正确反映数组元素数量
 * @note 运行时用例：实际执行验证不同创建方式下 length 属性的正确性
 */
function main(): void {
  let a: Valueint[] = [1, 2, 3]
  if (!(a.length == 3)) {
    throw new Error('assertion failed: a.length should equal 3')
  }

  let b: Valuedouble[] = [7., 8.]
  if (!(b.length == 2)) {
    throw new Error('assertion failed: b.length should equal 2')
  }

  let c: Valueint[] = new Valueint[](5, 0)
  if (!(c.length == 5)) {
    throw new Error('assertion failed: c.length should equal 5')
  }

  let d: Valuedouble[] = new Valuedouble[](4, 3.14)
  if (!(d.length == 4)) {
    throw new Error('assertion failed: d.length should equal 4')
  }

  let e: Valuechar[] = [c'x']
  if (!(e.length == 1)) {
    throw new Error('assertion failed: e.length should equal 1')
  }

  console.log('verified')
}
