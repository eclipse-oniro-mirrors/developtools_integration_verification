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
 * @id EXP_07_10_03_008_RUNTIME_SUPER_GETSET_CHAIN
 * @expect runtime
 * @section 7.10.3
 * @design 运行时验证 super getter+setter 完整链：先通过 super setter 设置，再通过 super getter 读取
 * @note 运行时用例：验证 super 同时在 getter 和 setter 中正确工作
 */
class Base {
    private _value: int = 0
    get prop(): int {
        return this._value
    }
    set prop(v: int) {
        this._value = v
    }
}
class Derived extends Base {
    get prop(): int {
        if (super.prop == 0) {
            return -1
        }
        return super.prop
    }
    set prop(v: int) {
        if (v >= 0) {
            super.prop = v
        }
    }
}
function main(): void {
    let d: Derived = new Derived()
    // 初始值 0，getter 返回 -1
    if (d.prop != -1) {
        throw new Error('assertion failed: initial getter value')
    }
    // 设置正值，通过 super setter 设置
    d.prop = 42
    if (d.prop != 42) {
        throw new Error('assertion failed: after setter value')
    }
console.log('verified')
}
