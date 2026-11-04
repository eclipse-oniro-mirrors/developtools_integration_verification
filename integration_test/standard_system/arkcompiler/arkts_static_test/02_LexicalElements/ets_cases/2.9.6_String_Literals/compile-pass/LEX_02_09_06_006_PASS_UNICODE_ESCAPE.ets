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
 * @id LEX_02_09_06_006_PASS_UNICODE_ESCAPE
 * @expect compile-pass
 * @section 2.9.6
 * @design Unicode 转义
 * @note compile-pass 用例：验证 Unicode 转义语法
 */

// 固定 Unicode 转义 (4位)
let s1: string = "\u0041"  // 'A'
let s2: string = "\u0061"  // 'a'
let s3: string = "\u0030"  // '0'
let s4: string = "\u4e16"  // '世'

// 有界 Unicode 转义
let s5: string = "\u{41}"    // 'A'
let s6: string = "\u{61}"    // 'a'
let s7: string = "\u{4e16}"  // '世'
let s8: string = "\u{1F600}" // 😀
