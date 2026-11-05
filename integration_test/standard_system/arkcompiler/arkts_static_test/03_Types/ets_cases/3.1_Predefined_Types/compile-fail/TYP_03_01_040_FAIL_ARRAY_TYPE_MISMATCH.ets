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
 * @id TYP_03_01_040_FAIL_ARRAY_TYPE_MISMATCH
 * @expect compile-fail
 * @section 3.1
 * @design 数组元素类型不匹配
 * @note 反向用例：验证数组字面量元素类型必须一致
 */
function testArrayTypeMismatchFail(): void {
  // int[] 不能接受 string 元素
  let arr1: int[] = [1, 2, "three"]

  // string[] 不能接受 number 元素
  let arr2: string[] = ["a", "b", 3]

  // boolean[] 不能接受 string
  let arr3: boolean[] = [true, false, "yes"]
}