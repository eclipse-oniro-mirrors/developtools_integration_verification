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
 * @id EXP_07_08_010_RUNTIME_MIXED_TYPES_PARENS
 * @expect runtime
 * @section 7.8
 * @design 多种类型括号表达式运行时验证：字符串、布尔值、条件表达式在括号中等价性
 * @note 运行时用例：验证多种类型的括号表达式值正确
 */
function main(): void {
    let s1: string = 'hello'
    let s2: string = ('hello')
    if (s1 != s2) {
        throw new Error('assertion failed: string parens differ')
    }

    let b1: boolean = true
    let b2: boolean = (true)
    if (b1 != b2) {
        throw new Error('assertion failed: boolean parens differ')
    }

    let x: int = 5
    let cmp1: boolean = x > 0
    let cmp2: boolean = (x > 0)
    if (cmp1 != cmp2) {
        throw new Error('assertion failed: condition parens differ')
    }
console.log('verified')
}
