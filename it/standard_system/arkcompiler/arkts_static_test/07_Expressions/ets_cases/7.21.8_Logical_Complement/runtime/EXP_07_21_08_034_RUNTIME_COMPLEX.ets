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
 * @id EXP_07_21_08_034_RUNTIME_COMPLEX
 * @expect runtime
 * @section 7.21.8
 * @design 验证 ! 与 &&、|| 组合的布尔逻辑
 * @note 运行时用例：! 与逻辑运算符组合
 */
function main(): void {
    // 验证德摩根定律：非与或与非
    if (!(true && true) != (!true || !true)) {
        throw new Error('assertion failed: De Morgan 1')
    }

    if (!(true && false) != (!true || !false)) {
        throw new Error('assertion failed: De Morgan 2')
    }

    // 验证德摩根定律：非或与非与
    if (!(true || false) != (!true && !false)) {
        throw new Error('assertion failed: De Morgan 3')
    }

    // 验证等值取反
    let a: boolean = true
    let b: boolean = false
    if (!(a == b) != (a != b)) {
        throw new Error('assertion failed: equality negated')
    }
console.log('verified')
}
