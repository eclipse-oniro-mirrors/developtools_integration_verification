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
 * @id EXP_07_21_08_033_RUNTIME_DOUBLE_NEG
 * @expect runtime
 * @section 7.21.8
 * @design 验证 !!x == x 双重取反恒等式
 * @note 运行时用例：!!x == x
 */
function main(): void {
    if (!!true != true) {
        throw new Error('assertion failed: !!true != true')
    }

    if (!!false != false) {
        throw new Error('assertion failed: !!false != false')
    }

    let x: boolean = true
    if (!!x != x) {
        throw new Error('assertion failed: !!x != x')
    }

    x = false
    if (!!x != x) {
        throw new Error('assertion failed: !!false != false')
    }
console.log('verified')
}
