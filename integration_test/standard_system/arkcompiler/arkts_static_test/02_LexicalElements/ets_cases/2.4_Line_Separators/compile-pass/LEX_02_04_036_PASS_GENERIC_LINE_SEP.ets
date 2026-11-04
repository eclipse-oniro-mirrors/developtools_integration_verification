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
 * @id LEX_02_04_036_PASS_GENERIC_LINE_SEP
 * @expect compile-pass
 * @section 2.4
 * @design 泛型内换行
 * @note compile-pass 用例：验证泛型中的换行符
 */

// 泛型内换行
let arr1: Array<
  int
> = [1, 2, 3]

// 嵌套泛型换行
let arr2: Array<
  Array<
    int
  >
> = [[1, 2], [3, 4]]

// 函数泛型换行
function identity<
  T
>(x: T): T {
  return x
}
