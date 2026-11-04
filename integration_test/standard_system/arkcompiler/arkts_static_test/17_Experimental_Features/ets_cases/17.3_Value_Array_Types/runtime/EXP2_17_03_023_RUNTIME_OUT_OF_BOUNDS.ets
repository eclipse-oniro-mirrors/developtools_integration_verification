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
 * @id EXP2_17_03_023_RUNTIME_OUT_OF_BOUNDS
 * @expect runtime
 * @section 17.3
 * @design 运行时验证 ValueArray 越界索引访问的行为（应抛出异常或返回 undefined）
 * @note 运行时用例：实际执行验证越界访问的运行时行为
 *       ⚠️ SPEC 不一致：编译器 ESE0247 在编译期拒绝负索引常量（a[-1]），实现比 spec 更严格
 *       分类：D 类（Spec 与实现不一致）
 */
function main(): void {
  let a: Valueint[] = [1, 2, 3]
  // Verify valid access works
  if (!(a[0] == 1)) {
    throw new Error('assertion failed: valid access a[0] should work')
  }
  if (!(a[2] == 3)) {
    throw new Error('assertion failed: valid access a[2] should work')
  }

  // Verify out-of-bounds access throws
  let outOfBoundsCaught: boolean = false
  try {
    let bad: int = a[10]
  } catch (e) {
    outOfBoundsCaught = true
  }
  if (!outOfBoundsCaught) {
    throw new Error('assertion failed: out-of-bounds access should throw')
  }

  // Verify negative index access throws
  let negativeIndexCaught: boolean = false
  try {
    let bad: int = a[-1]
  } catch (e) {
    negativeIndexCaught = true
  }
  if (!negativeIndexCaught) {
    throw new Error('assertion failed: negative index access should throw')
  }

  // Verify valid boundary access works
  if (!(a[2] == 3)) {
    throw new Error('assertion failed: a[2] boundary access should still work')
  }

  console.log('verified')
}
