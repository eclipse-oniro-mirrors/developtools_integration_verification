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
 * @id EXP_07_08_009_RUNTIME_GROUPING_ORDER
 * @expect runtime
 * @section 7.8
 * @design 括号分组改变求值顺序：(1 + 2) * 3 正确得到 9，验证括号改变运算优先级
 * @note 运行时用例：验证括号分组改变求值顺序
 */
function main(): void {
    // Without parens: 1 + 2 * 3 = 1 + 6 = 7
    let without: int = 1 + 2 * 3
    // With parens: (1 + 2) * 3 = 3 * 3 = 9
    let withParen: int = (1 + 2) * 3
    if (withParen != 9) {
        throw new Error('assertion failed: (1+2)*3 != 9, got ' + withParen)
    }
    if (without != 7) {
        throw new Error('assertion failed: 1+2*3 != 7, got ' + without)
    }
console.log('verified')
}
