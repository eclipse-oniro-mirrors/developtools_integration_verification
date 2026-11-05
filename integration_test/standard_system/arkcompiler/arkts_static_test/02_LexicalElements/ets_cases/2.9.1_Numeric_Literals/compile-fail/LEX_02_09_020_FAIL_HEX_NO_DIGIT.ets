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
 * @id LEX_02_09_020_FAIL_HEX_NO_DIGIT
 * @expect compile-fail
 * @section 2.9.1
 * @design 十六进制前缀后无数字
 * @note compile-fail 用例：验证编译器拒绝无效十六进制
 */

// 0x 后必须有至少一个十六进制数字
let x: int = 0x  // ❌ 应该报错：无效的十六进制字面量
