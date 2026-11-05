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
 * @id LEX_02_09_06_005_PASS_HEX_ESCAPE
 * @expect compile-pass
 * @section 2.9.6
 * @design 十六进制转义
 * @note compile-pass 用例：验证十六进制转义语法
 */

// 十六进制转义
let s1: string = "\x41"  // 'A'
let s2: string = "\x61"  // 'a'
let s3: string = "\x30"  // '0'
let s4: string = "\x0A"  // 换行符
let s5: string = "\xFF"  // 255
