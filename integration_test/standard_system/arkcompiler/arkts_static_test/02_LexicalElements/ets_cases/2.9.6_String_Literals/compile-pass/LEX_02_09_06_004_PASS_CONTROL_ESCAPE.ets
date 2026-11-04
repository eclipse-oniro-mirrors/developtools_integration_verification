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
 * @id LEX_02_09_06_004_PASS_CONTROL_ESCAPE
 * @expect compile-pass
 * @section 2.9.6
 * @design 控制字符转义
 * @note compile-pass 用例：验证控制字符转义语法
 */

// 控制字符转义
let s1: string = "\b"  // 退格符
let s2: string = "\f"  // 换页符
let s3: string = "\n"  // 换行符
let s4: string = "\r"  // 回车符
let s5: string = "\t"  // 水平制表符
let s6: string = "\v"  // 垂直制表符

// 混合使用
let s7: string = "line1\nline2"
let s8: string = "col1\tcol2"
