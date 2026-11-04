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
 * @id LEX_02_09_02_006_PASS_TYPE_INFERENCE_INT
 * @expect compile-pass
 * @section 2.9.2
 * @design 整数类型推断为 int
 * @note compile-pass 用例：验证 int 类型推断
 */

// 类型推断为 int
let x1 = 0
let x2 = 1
let x3 = 0x7F
let x4 = 0x7FFF_FFFF  // max(int)
let x5 = 2147483647    // max(int)
