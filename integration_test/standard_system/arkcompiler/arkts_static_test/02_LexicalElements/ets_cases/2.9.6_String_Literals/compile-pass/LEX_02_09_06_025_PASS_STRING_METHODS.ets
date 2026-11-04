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
 * @id LEX_02_09_06_025_PASS_STRING_METHODS
 * @expect compile-pass
 * @section 2.9.6
 * @design 字符串方法
 * @note compile-pass 用例：验证字符串方法语法
 */

// 字符串方法
let s1 = "Hello"
let c1 = s1.charAt(0)
let s2 = s1.substring(0, 3)
let s3 = s1.toUpperCase()
let s4 = s1.toLowerCase()
let s5 = s1.trim()
let s6 = s1.replace("l", "L")
let s7 = s1.split(" ")
