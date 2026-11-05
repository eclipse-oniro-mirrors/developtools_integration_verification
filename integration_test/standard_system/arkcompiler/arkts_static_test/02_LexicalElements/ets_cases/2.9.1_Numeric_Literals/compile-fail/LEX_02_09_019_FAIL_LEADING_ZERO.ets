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
 * @id LEX_02_09_019_FAIL_LEADING_ZERO
 * @expect compile-fail
 * @section 2.9.1
 * @design 前导零语法不支持（八进制旧语法）
 * @note compile-fail 用例：验证编译器拒绝前导零语法
 */

// 前导零语法在 ArkTS 中不支持
// 应该使用 0o 前缀表示八进制
let x: int = 0123  // ❌ 应该报错：前导零语法不支持
