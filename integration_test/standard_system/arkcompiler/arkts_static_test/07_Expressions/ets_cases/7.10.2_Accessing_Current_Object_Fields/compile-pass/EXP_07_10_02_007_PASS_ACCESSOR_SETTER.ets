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
 * @id EXP_07_10_02_007_PASS_ACCESSOR_SETTER
 * @expect compile-pass
 * @section 7.10.2
 * @design Accessor setter 调用：字段访问在赋值左侧时调用 setter
 * @note 正向用例：验证属性访问器 setter 在赋值时被调用
 */
class Temperature {
    private _celsius: int = 0
    get fahrenheit(): int {
        return this._celsius * 9 / 5 + 32
    }
    set fahrenheit(val: int) {
        this._celsius = (val - 32) * 5 / 9
    }
}
function update(): void {
    let t: Temperature = new Temperature()
    t.fahrenheit = 212
    let v: int = t.fahrenheit
}
