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
 * @id EXP_07_10_03_006_RUNTIME_SUPER_GETTER_VALUE
 * @expect runtime
 * @section 7.10.3
 * @design 运行时验证 super getter 调用：子类通过 super getter 访问超类属性值
 * @note 运行时用例：验证 super.property 在 getter 中返回超类值
 */
class Base {
    get value(): int {
        return 100
    }
}
class Derived extends Base {
    get value(): int {
        return super.value + 50
    }
}
function main(): void {
    let d: Derived = new Derived()
    if (d.value != 150) {
        throw new Error('assertion failed: super getter value')
    }
console.log('verified')
}
