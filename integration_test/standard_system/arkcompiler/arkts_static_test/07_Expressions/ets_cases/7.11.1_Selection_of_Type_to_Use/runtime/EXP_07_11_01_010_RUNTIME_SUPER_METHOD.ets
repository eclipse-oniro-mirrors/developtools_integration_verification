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
 * @id EXP_07_11_01_010_RUNTIME_SUPER_METHOD
 * @expect runtime
 * @section 7.11.1
 * @design 运行时验证 super 形式方法调用
 * @note 运行时用例：验证 super.method() 运行时调用超类方法
 */
class Base {
    value(): int {
        return 10
    }
}
class Derived extends Base {
    value(): int {
        return super.value() + 5
    }
}
function main(): void {
    let d: Derived = new Derived()
    if (d.value() != 15) {
        throw new Error('assertion failed: super method result')
    }
console.log('verified')
}
