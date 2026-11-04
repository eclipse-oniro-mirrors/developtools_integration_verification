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
 * @id EXP_07_11_01_011_RUNTIME_INTERFACE_METHOD
 * @expect runtime
 * @section 7.11.1
 * @design 运行时验证 interface 类型表达式的方法调用（多态分发）
 * @note 运行时用例：验证接口引用调用方法时正确分派到实际实现
 */
interface Calculable {
    compute(): int
}
class Add implements Calculable {
    compute(): int {
        return 42
    }
}
class Mul implements Calculable {
    compute(): int {
        return 100
    }
}
function main(): void {
    let a: Calculable = new Add()
    let m: Calculable = new Mul()
    if (a.compute() != 42) {
        throw new Error('assertion failed: Add compute')
    }
    if (m.compute() != 100) {
        throw new Error('assertion failed: Mul compute')
    }
console.log('verified')
}
