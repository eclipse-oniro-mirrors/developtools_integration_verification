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
 * @id EXP2_17_04_005_PASS_BOOLEAN_ARRAY_CREATION
 * @expect compile-pass
 * @section 17.4
 * @design boolean 类型数组创建：验证 new boolean[2](true) 创建 boolean 数组，所有元素初始化为 true
 * @note 正向用例：验证 boolean 作为数组元素类型编译通过
 */
function testBooleanArrayCreation(): void {
  let arr = new boolean[2](true)
  console.log(arr.length)
  console.log(arr[0])
  console.log(arr[1])
}
