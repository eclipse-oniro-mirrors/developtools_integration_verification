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
 * @id LEX_02_09_018_PASS_LONG_OVERFLOW
 * @expect compile-pass
 * @section 2.9.1
 * @design long 超出 int 范围
 * @note compile-pass 用例：验证 long 类型字面量
 */

// 超出 int 范围的整数
let x: long = 2147483648
let y: long = 9223372036854775807
