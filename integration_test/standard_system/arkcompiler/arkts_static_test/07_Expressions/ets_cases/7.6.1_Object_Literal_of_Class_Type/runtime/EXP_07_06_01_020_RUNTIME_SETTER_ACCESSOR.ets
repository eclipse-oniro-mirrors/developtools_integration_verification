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
 * @id EXP_07_06_01_020_RUNTIME_SETTER_ACCESSOR
 * @expect runtime
 * @section 7.6.1
 * @design setter 访问器运行时验证：对象字面量 {attr: 42} 触发 setter，验证 backing field 值
 * @note 运行时用例：验证对象字面量中 setter 访问器被正确调用
 */
class OK {
    private _attr: number = 0
    get attr(): number {
        return this._attr
    }
    set attr(val: number) {
        this._attr = val
    }
}

function main(): void {
    const a: OK = {attr: 42}
    if (a.attr != 42) {
        throw new Error('assertion failed: attr != 42, got ' + a.attr)
    }
console.log('verified')
}
