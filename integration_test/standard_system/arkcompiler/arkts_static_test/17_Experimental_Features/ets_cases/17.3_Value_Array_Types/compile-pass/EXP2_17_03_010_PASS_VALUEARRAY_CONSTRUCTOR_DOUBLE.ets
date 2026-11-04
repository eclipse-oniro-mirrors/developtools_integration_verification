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
 * @id EXP2_17_03_010_PASS_VALUEARRAY_CONSTRUCTOR_DOUBLE
 * @expect compile-pass
 * @section 17.3
 * @design Valuedouble[] 使用构造函数创建：new Valuedouble[](3, 7.) 创建含 3 个 7.0 元素的数组
 * @note 正向用例：验证该特性编译通过的正确用法
 */
function testValueArrayConstructorDouble(): void {
  let a: Valuedouble[] = new Valuedouble[](3, 7.)
  console.log(a[0])
  console.log(a[1])
  console.log(a[2])
  console.log(a.length)
}
