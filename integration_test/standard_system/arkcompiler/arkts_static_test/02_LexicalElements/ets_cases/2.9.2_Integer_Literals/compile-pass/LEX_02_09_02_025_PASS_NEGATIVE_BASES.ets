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
 * @id LEX_02_09_02_025_PASS_NEGATIVE_BASES
 * @expect compile-pass
 * @section 2.9.2
 * @design 负数进制表示
 * @note compile-pass 用例：验证负数的不同进制表示
 */

// 负数的不同进制表示
let x1 = -42
let x2 = -0xFF
let x3 = -0o77
let x4 = -0b1010
