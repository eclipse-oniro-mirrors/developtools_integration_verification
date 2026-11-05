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
 * @id EXP_07_06_01_009_PASS_SETTER_ACCESSOR
 * @expect compile-pass
 * @section 7.6.1
 * @design setter 访问器可作对象字面量字段：class OK { set attr(val: number) { ... } }，{attr: 42} 合法
 * @note 正向用例：验证 setter 访问器名能用作对象字面量中的字段
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
const a: OK = {attr: 42}
