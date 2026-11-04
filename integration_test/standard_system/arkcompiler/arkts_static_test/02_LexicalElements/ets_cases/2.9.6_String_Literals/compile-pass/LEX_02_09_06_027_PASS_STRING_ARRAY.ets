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
 * @id LEX_02_09_06_027_PASS_STRING_ARRAY
 * @expect compile-pass
 * @section 2.9.6
 * @design 字符串数组
 * @note compile-pass 用例：验证字符串数组语法
 */

// 字符串数组
let arr1: string[] = ["Hello", "World"]
let arr2: Array<string> = ["foo", "bar", "baz"]

// 字符串数组访问
let s1 = arr1[0]
let s2 = arr1[1]

// 字符串数组长度
let len = arr1.length
