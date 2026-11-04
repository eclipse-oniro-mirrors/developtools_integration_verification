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
 * @id EXP_07_10_03_002_PASS_SUPER_SETTER
 * @expect compile-pass
 * @section 7.10.3
 * @design 通过 super 调用超类的 setter：super.property = val 在子类 setter 中调用超类访问器
 * @note 正向用例：验证 super.identifier 可用于调用超类 setter
 */
class Base {
    private _val: int = 0
    get value(): int {
        return this._val
    }
    set value(v: int) {
        this._val = v
    }
}
class Derived extends Base {
    set value(v: int) {
        if (v > 0) {
            super.value = v
        }
    }
}
let d: Derived = new Derived()
d.value = 10
