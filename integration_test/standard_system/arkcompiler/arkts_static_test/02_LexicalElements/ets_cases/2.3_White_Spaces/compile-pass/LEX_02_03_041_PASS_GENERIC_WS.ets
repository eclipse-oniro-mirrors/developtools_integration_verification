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
 * @id LEX_02_03_041_PASS_GENERIC_WS
 * @expect compile-pass
 * @section 2.3
 * @design 泛型中空白
 * @note compile-pass 用例：验证泛型中的空白
 */

// 泛型中空白
let arr1: Array<int> = [1, 2, 3]
let arr2: Array < int > = [4, 5, 6]
let arr3: Array< int > = [7, 8, 9]
let arr4: Array <int> = [10, 11, 12]

// 嵌套泛型
let arr5: Array<Array<int>> = [[1, 2], [3, 4]]
let arr6: Array < Array < int > > = [[5, 6], [7, 8]]
