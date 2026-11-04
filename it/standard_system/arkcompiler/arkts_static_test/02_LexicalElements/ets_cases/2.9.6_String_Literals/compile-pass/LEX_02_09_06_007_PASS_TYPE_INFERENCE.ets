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
 * @id LEX_02_09_06_007_PASS_TYPE_INFERENCE
 * @expect compile-pass
 * @section 2.9.6
 * @design 类型推断
 * @note compile-pass 用例：验证字符串类型推断
 */

// 字面量类型推断
let s1 = "Hello"
let s2 = 'World'

// 运算后变为 string 类型
let s3 = "Hello" + " World"
let s4 = "Value: " + "42"
