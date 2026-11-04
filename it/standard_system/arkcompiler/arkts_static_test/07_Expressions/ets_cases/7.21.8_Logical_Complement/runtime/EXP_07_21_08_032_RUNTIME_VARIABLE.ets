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
 * @id EXP_07_21_08_032_RUNTIME_VARIABLE
 * @expect runtime
 * @section 7.21.8
 * @design 验证 boolean 变量取反运行时正确
 * @note 运行时用例：变量 !x
 */
function main(): void {
    let x: boolean = true
    let r1: boolean = !x
    if (r1 != false) {
        throw new Error('assertion failed: !true != false')
    }

    x = false
    let r2: boolean = !x
    if (r2 != true) {
        throw new Error('assertion failed: !false != true')
    }

    // successive application toggles
    x = true
    x = !x  // false
    x = !x  // true
    if (x != true) {
        throw new Error('assertion failed: toggle x != true')
    }
console.log('verified')
}
