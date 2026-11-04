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
 * @id EXP_07_06_02_024_RUNTIME_METHOD_CALL
 * @expect runtime
 * @section 7.6.2
 * @design 对象字面量方法调用验证：实现的方法可正确调用并返回预期结果
 * @note 运行时用例：验证接口对象字面量中的方法可正常调用
 */
interface I {
    twice(x: number): number
}

function main(): void {
    const i: I = { twice(x: number): number { return x * 2 } }
    if (i.twice(21) != 42) {
        throw new Error('assertion failed: twice(21) != 42, got ' + i.twice(21))
    }
console.log('verified')
}
