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
 * @id EXP2_17_08_01_005_PASS_FOR_OF_ANY_ON_MIXED_ARRAY
 * @expect compile-pass
 * @section 17.8.1
 * @design for-of 循环变量显式标注 Any 类型遍历任意类型数组：Any 是顶类型，接受一切值
 * @note 正向用例：验证该特性编译通过的正确用法
 */
function testForOfAnyOnMixedArray(): void {
  let arr: Any[] = [1, 'two', 3.0]
  let count: int = 0
  for (let a: Any of arr) {
    count = count + 1
  }
  console.log(count)
}
