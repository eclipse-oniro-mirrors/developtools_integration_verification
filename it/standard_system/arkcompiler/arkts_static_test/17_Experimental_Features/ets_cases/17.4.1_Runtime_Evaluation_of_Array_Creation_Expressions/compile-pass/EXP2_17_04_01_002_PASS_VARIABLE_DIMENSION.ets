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
 * @id EXP2_17_04_01_002_PASS_VARIABLE_DIMENSION
 * @expect compile-pass
 * @section 17.4.1
 * @design 变量维度数组创建表达式：验证使用变量作为维度参数的数组创建编译通过
 * @note 正向用例：运行时维度值由变量决定
 */
function testVariableDimension(): void {
  let size: int = 3
  let arr: int[] = new int[size] (99)
  console.log(arr.length)
  console.log(arr[0])
}
