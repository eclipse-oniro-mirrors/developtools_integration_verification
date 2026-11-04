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
 * @id LEX_02_09_07_010_PASS_MULTILINE_INTERPOLATION
 * @expect compile-pass
 * @section 2.9.7
 * @design 多行字符串插值
 * @note compile-pass 用例：验证多行字符串插值语法
 */

// 多行字符串插值
let name = "World"
let s1 = `Hello, ${name}!`

let x = 10
let y = 20
let s2 = `Sum: ${x + y}`

// 多行插值
let s3 = `Line 1: ${name}
Line 2: ${x + y}`
