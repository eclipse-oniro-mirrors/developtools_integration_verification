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
 * @id EXP_07_11_01_012_RUNTIME_TYPE_PARAM_METHOD
 * @expect runtime
 * @section 7.11.1
 * @design 运行时验证泛型类型参数方法调用
 * @note 运行时用例：验证类型参数约束的方法在运行时正确执行
 */
interface Processor {
    process(val: int): int
}
class DoubleProcessor implements Processor {
    process(val: int): int {
        return val * 2
    }
}
function run<T extends Processor>(p: T, val: int): int {
    return p.process(val)
}
function main(): void {
    let d: DoubleProcessor = new DoubleProcessor()
    let r: int = run<Processor>(d, 21)
    if (r != 42) {
        throw new Error('assertion failed: type param method result')
    }
console.log('verified')
}
