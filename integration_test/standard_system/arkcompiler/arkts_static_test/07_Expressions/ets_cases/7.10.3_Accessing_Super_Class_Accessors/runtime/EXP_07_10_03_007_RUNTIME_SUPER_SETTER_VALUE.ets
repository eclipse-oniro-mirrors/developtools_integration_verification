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
 * @id EXP_07_10_03_007_RUNTIME_SUPER_SETTER_VALUE
 * @expect runtime
 * @section 7.10.3
 * @design 运行时验证 super setter 调用：子类通过 super setter 设置超类属性值
 * @note 运行时用例：验证 super.property = val 在 setter 中正确设置超类值
 */
class Base {
    private _val: int = 0
    get data(): int {
        return this._val
    }
    set data(v: int) {
        this._val = v
    }
}
class Derived extends Base {
    set data(v: int) {
        super.data = v + 1
    }
}
function main(): void {
    let d: Derived = new Derived()
    d.data = 10
    let v: int = d.data
    if (v != 11) {
        throw new Error('assertion failed: super setter value')
    }
console.log('verified')
}
