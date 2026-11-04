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
 * @id EXP_07_08_006_PASS_STRING_AND_BOOL_PARENS
 * @expect compile-pass
 * @section 7.8
 * @design 字符串和布尔型括号表达式验证：括号不影响多种类型的表达式
 * @note 正向用例：验证括号在不同类型的表达式中类型不变
 */
let s: string = ('hello')
let b: boolean = (true)
let result: string = s + b
