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
 * @id EXP2_17_02_01_020_RUNTIME_ELEMENT_COUNT
 * @expect runtime
 * @section 17.2.1
 * @design 运行时验证 FixedArray 构造函数创建正确数量的元素
 * @note 运行时用例：验证 new Fixedint[](5, 42) 创建 5 个元素
 */
function main(): void {
  let a: Fixedint[] = new Fixedint[](5, 42)
  if (a.length != 5) {
    throw new Error("assertion failed: expected length 5, got " + a.length)
  }
  let small: Fixedstring[] = new Fixedstring[](1, "x")
  if (small.length != 1) {
    throw new Error("assertion failed: expected length 1, got " + small.length)
  }
  let large: Fixedint[] = new Fixedint[](100, 0)
  if (large.length != 100) {
    throw new Error("assertion failed: expected length 100, got " + large.length)
  }
  console.log('verified')
}
