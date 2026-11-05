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
 * @id EXP_07_11_02_011_RUNTIME_SUPER_METHOD
 * @expect runtime
 * @section 7.11.2
 * @design super 形式运行时行为：super.identifier 调用超类实例方法，候选集合包含超类实例方法
 * @note 运行时用例：验证 super 方法在运行时能正确调用超类实现并返回值
 */
class Base {
    baseValue(): int {
        return 100
    }
    greet(): string {
        return 'Base'
    }
}

class Derived extends Base {
    baseValue(): int {
        return super.baseValue() + 50
    }
    greet(): string {
        return super.greet() + '+Derived'
    }
}

function main(): void {
    let d: Derived = new Derived()

    let val: int = d.baseValue()
    if (val != 150) {
        throw new Error('assertion failed: expected 150, got ' + val.toString())
    }

    let g: string = d.greet()
    if (g != 'Base+Derived') {
        throw new Error('assertion failed: expected Base+Derived, got ' + g)
    }
console.log('verified')
}
