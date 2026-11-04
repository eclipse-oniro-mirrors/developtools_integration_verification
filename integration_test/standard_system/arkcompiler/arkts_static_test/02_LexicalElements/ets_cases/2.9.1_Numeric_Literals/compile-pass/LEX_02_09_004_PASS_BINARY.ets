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
 * @id LEX_02_09_004_PASS_BINARY
 * @expect compile-pass
 * @section 2.9.1
 * @design 二进制整数字面量
 * @note compile-pass 用例：验证二进制整数语法
 */

// 二进制整数
let x1: int = 0b1010
let x2: int = 0b0
let x3: int = 0b11111111
let x4: int = 0b101010
