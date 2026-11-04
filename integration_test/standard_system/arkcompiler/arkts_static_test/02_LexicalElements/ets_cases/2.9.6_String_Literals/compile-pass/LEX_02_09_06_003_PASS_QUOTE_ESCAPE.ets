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
 * @id LEX_02_09_06_003_PASS_QUOTE_ESCAPE
 * @expect compile-pass
 * @section 2.9.6
 * @design 引号和反斜杠转义
 * @note compile-pass 用例：验证引号和反斜杠转义语法
 */

// 引号转义
let s1: string = "He said \"Hi\""
let s2: string = 'don\'t worry'
let s3: string = "don't worry"

// 反斜杠转义
let s4: string = "\\"
let s5: string = "C:\\Users\\test"
