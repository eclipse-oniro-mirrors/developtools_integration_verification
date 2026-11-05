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
 * @id EXP_07_10_02_006_PASS_ACCESSOR_GETTER
 * @expect compile-pass
 * @section 7.10.2
 * @design Accessor getter 调用：字段访问不在赋值左侧时调用 getter
 * @note 正向用例：验证属性访问器 getter 在读取时被调用
 */
class Rect {
    private _width: int = 10
    private _height: int = 20
    get area(): int {
        return this._width * this._height
    }
    get perimeter(): int {
        return 2 * (this._width + this._height)
    }
}
let r: Rect = new Rect()
let a: int = r.area
let p: int = r.perimeter
