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
 * @id LEX_02_09_07_003_PASS_ESCAPE
 * @expect compile-pass
 * @section 2.9.7
 * @design 转义序列
 * @note compile-pass 用例：验证多行字符串中的转义序列
 */

// 转义反引号
let s1 = `This is a \` backtick`

// 转义反斜杠
let s2 = `This is a \\ backslash`

// 其他转义序列
let s3 = `Tab:\t Newline:\n`
