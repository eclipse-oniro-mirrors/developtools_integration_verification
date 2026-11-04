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
 * @id EXP2_17_04_001_PASS_NUMBER_ARRAY_CREATION
 * @expect compile-pass
 * @section 17.4
 * @design 基本 number 数组创建：验证 new number[3](7) 语法正确编译，创建包含 3 个元素均为 7 的数组
 * @note 正向用例：验证该特性编译通过的正确用法
 */
function testNumberArrayCreation(): void {
  let x = new number[3](7)
  console.log(x.length)
  console.log(x[0])
  console.log(x[1])
  console.log(x[2])
}
