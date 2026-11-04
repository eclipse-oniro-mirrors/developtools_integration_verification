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
 * @id EXP2_17_02_01_007_PASS_LENGTH_PROPERTY
 * @expect compile-pass
 * @section 17.2.1
 * @design FixedArray length 属性访问：验证 a.length 正确编译，无论通过构造函数还是字面量创建
 * @note 正向用例：验证该特性编译通过的正确用法
 */
function testLengthProperty(): void {
  let a: Fixedstring[] = new Fixedstring[](5, "x")
  let count: int = a.length
  console.log(count)

  let b: Fixednumber[] = [1, 2, 3, 4]
  let countB: int = b.length
  console.log(countB)

  let c: Fixedint[] = new Fixedint[](1, 99)
  console.log(c.length)
}
