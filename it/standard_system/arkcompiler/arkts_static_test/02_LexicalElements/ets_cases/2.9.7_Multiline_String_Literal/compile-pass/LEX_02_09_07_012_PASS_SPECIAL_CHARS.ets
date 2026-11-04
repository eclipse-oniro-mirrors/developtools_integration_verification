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
 * @id LEX_02_09_07_012_PASS_SPECIAL_CHARS
 * @expect compile-pass
 * @section 2.9.7
 * @design 特殊字符在多行字符串中
 * @note compile-pass 用例：验证特殊字符在多行字符串中的使用
 */

// 特殊字符
let s1 = `Hello, World! 123`
let s2 = `Special chars: !@#$%^&*()`
let s3 = `Unicode: 你好世界`
let s4 = `Emoji: 😀`
