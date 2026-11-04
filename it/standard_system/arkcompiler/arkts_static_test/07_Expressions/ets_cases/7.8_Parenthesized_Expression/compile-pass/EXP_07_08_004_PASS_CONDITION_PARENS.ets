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
 * @id EXP_07_08_004_PASS_CONDITION_PARENS
 * @expect compile-pass
 * @section 7.8
 * @design 条件语句中括号表达式：if ((x > 0))，验证括号在条件中使用
 * @note 正向用例：验证条件语句中使用括号表达式
 */
function test(x: int): int {
    if ((x > 0)) {
        return x
    }
    return 0
}
let result: int = test(5)
