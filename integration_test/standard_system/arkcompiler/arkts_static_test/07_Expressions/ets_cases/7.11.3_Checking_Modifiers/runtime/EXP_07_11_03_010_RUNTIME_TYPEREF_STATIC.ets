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
 * @id EXP_07_11_03_010_RUNTIME_TYPEREF_STATIC
 * @expect runtime
 * @section 7.11.3
 * @design typeReference.identifier 调用静态方法运行时验证：修饰符检查通过后，静态方法正确执行
 * @note 运行时用例：验证 typeReference 形式静态方法调用的运行时行为
 */
class Utility {
    static add(a: int, b: int): int {
        return a + b
    }
    static getLabel(): string {
        return 'STATIC'
    }
}

function main(): void {
    let sum: int = Utility.add(10, 20)
    if (sum != 30) {
        throw new Error('assertion failed: expected 30, got ' + sum.toString())
    }

    let label: string = Utility.getLabel()
    if (label != 'STATIC') {
        throw new Error('assertion failed: expected STATIC, got ' + label)
    }
console.log('verified')
}
