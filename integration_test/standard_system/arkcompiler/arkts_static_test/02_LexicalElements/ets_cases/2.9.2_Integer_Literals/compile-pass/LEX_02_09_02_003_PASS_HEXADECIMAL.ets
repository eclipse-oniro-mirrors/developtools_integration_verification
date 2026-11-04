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
 * @id LEX_02_09_02_003_PASS_HEXADECIMAL
 * @expect compile-pass
 * @section 2.9.2
 * @design 十六进制整数字面量
 * @note compile-pass 用例：验证十六进制整数语法
 */

// 十六进制整数
let x1: int = 0xBAD3
let x2: int = 0xBAD_3
let x3: int = 0x7F
let x4: int = 0x7FFF_FFFF  // max(int)
let x5: long = 0x8000_0000  // 超出 int 范围，推断为 long
let x6: long = 0x7FFF_FFFF_FFFF_FFFF  // max(long)
