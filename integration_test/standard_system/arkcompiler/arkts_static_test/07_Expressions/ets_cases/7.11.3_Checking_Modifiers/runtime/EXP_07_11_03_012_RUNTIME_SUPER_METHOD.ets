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
 * @id EXP_07_11_03_012_RUNTIME_SUPER_METHOD
 * @expect runtime
 * @section 7.11.3
 * @design super.identifier 调用实例方法运行时验证：修饰符检查通过后，super 方法正确执行
 * @note 运行时用例：验证 super 形式实例方法调用的运行时行为
 */
class Base {
    getValue(): int {
        return 100
    }
    getLabel(): string {
        return 'Base'
    }
}

class Derived extends Base {
    getValue(): int {
        return super.getValue() + 50
    }
    getLabel(): string {
        return super.getLabel() + '+Derived'
    }
}

function main(): void {
    let d: Derived = new Derived()

    let v: int = d.getValue()
    if (v != 150) {
        throw new Error('assertion failed: expected 150, got ' + v.toString())
    }

    let label: string = d.getLabel()
    if (label != 'Base+Derived') {
        throw new Error('assertion failed: expected Base+Derived, got ' + label)
    }
console.log('verified')
}
