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
 * @id EXP2_17_02_01_023_RUNTIME_LENGTH_AFTER_CREATION
 * @expect runtime
 * @section 17.2.1
 * @design 运行时验证 FixedArray 创建后 length 属性正确
 * @note 运行时用例：验证通过构造函数和字面量创建的数组长度正确
 */
function main(): void {
  let a: Fixedstring[] = new Fixedstring[](7, 'test')
  if (a.length != 7) {
    throw new Error("assertion failed: constructor array length expected 7, got " + a.length)
  }

  let b: Fixednumber[] = [10, 20, 30]
  if (b.length != 3) {
    throw new Error("assertion failed: literal array length expected 3, got " + b.length)
  }

  let c: Fixedint[] = new Fixedint[](0, 0)
  if (c.length != 0) {
    throw new Error("assertion failed: empty array length expected 0, got " + c.length)
  }

  let d: Fixedint[] = new Fixedint[](1, 42)
  if (d.length != 1) {
    throw new Error("assertion failed: single-element array length expected 1, got " + d.length)
  }
  console.log('verified')
}
