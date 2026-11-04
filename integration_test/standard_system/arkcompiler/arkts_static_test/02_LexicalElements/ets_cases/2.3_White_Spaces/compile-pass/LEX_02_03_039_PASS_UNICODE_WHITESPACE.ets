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
 * @id LEX_02_03_039_PASS_UNICODE_WHITESPACE
 * @expect compile-pass
 * @section 2.3
 * @design 其他 Unicode 空白字符
 * @note compile-pass 用例：验证其他 Unicode 空白字符作为分隔符
 */

// Unicode 空白字符作为分隔符
// U+2000 EN QUAD
let x1:int=1
let y1:int=2

// U+2002 EN SPACE
let x2:int=3
let y2:int=4

// U+2003 EM SPACE
let x3:int=5
let y3:int=6

// U+2009 THIN SPACE
let x4:int=7
let y4:int=8

// U+202F NARROW NO-BREAK SPACE
let x5:int=9
let y5:int=10

// U+205F MEDIUM MATHEMATICAL SPACE
let x6:int=11
let y6:int=12

// U+3000 IDEOGRAPHIC SPACE (全角空格)
let x7:int=13
let　y7:int=14
