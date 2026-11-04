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
 * @id EXP2_17_02_01_022_RUNTIME_OUT_OF_BOUNDS
 * @expect runtime
 * @section 17.2.1
 * @design 运行时验证 FixedArray 越界下标访问抛出运行时错误
 * @note 运行时用例：数组长度为 3，访问 a[3] 应抛出运行时错误（out of bounds）
 *       ⚠️ SPEC 不一致：编译器 ESE0247 在编译期拒绝负索引常量（a[-1]），比 spec 更严格
 *       分类：D 类（Spec 与实现不一致）
 */
function main(): void {
  let a: Fixedint[] = new Fixedint[](3, 1)
  let caught: boolean = false
  try {
    let y: int = a[3]
    console.log(y)
  } catch (e) {
    caught = true
  }
  if (!caught) {
    throw new Error('assertion failed: out-of-bounds access should have thrown')
  }

  let caughtNegative: boolean = false
  try {
    let z: int = a[-1]
    console.log(z)
  } catch (eNeg) {
    caughtNegative = true
  }
  if (!caughtNegative) {
    throw new Error('assertion failed: negative index access should have thrown')
  }
  console.log('verified')
}
