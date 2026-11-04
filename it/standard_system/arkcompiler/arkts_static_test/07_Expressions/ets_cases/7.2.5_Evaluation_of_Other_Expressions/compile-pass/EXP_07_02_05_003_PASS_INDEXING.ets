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
 * @id EXP_07_02_05_003_PASS_INDEXING
 * @expect compile-pass
 * @section 7.2.5
 * @design 索引表达式基本编译通过：数组索引、字符串索引、嵌套索引
 * @note 正向用例：验证 Indexing Expressions 编译通过
 */
let arr: int[] = [10, 20, 30]
let s: string = 'hello'

let v1: int = arr[0]
let v2: int = arr[1 + 1]
let c: string = s[0]
let v3: int = arr[arr[0]]
