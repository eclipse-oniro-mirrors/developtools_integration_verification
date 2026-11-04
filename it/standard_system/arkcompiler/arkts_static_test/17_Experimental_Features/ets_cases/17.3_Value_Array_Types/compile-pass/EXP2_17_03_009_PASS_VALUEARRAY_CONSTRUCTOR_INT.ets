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
 * @id EXP2_17_03_009_PASS_VALUEARRAY_CONSTRUCTOR_INT
 * @expect compile-pass
 * @section 17.3
 * @design Valueint[] 使用构造函数创建：new Valueint[](5, 0) 创建含 5 个零元素的数组
 * @note 正向用例：验证该特性编译通过的正确用法
 */
function testValueArrayConstructorInt(): void {
  let a: Valueint[] = new Valueint[](5, 0)
  console.log(a[0])
  console.log(a[4])
  console.log(a.length)
}
