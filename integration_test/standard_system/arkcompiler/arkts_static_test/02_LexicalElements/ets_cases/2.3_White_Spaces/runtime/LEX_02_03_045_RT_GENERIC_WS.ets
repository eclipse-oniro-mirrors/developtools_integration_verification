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
 * @id LEX_02_03_045_RT_GENERIC_WS
 * @expect runtime
 * @section 2.3
 * @design 泛型中空白运行时验证
 * @note runtime 用例：验证泛型中的空白不影响程序行为
 */

function main(): void {
  // 泛型中空白不影响程序行为
  let arr1: Array<int> = [1, 2, 3]
  let arr2: Array < int > = [4, 5, 6]
  let arr3: Array< int > = [7, 8, 9]

  // 验证数组访问
  if (arr1[0] !== 1) { throw new Error("arr1[0] failed, got " + arr1[0]) }
  if (arr2[0] !== 4) { throw new Error("arr2[0] failed, got " + arr2[0]) }
  if (arr3[0] !== 7) { throw new Error("arr3[0] failed, got " + arr3[0]) }

  // 验证数组长度
  if (arr1.length !== 3) { throw new Error("arr1.length failed, got " + arr1.length) }
  if (arr2.length !== 3) { throw new Error("arr2.length failed, got " + arr2.length) }
  if (arr3.length !== 3) { throw new Error("arr3.length failed, got " + arr3.length) }
}
