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
 * @id EXP_07_06_01_018_FAIL_GETTER_ONLY_ACCESSOR
 * @expect compile-fail
 * @section 7.6.1
 * @design getter-only 访问器（无 setter）用作对象字面量字段：{attr: 42} 应为编译时错误
 * @note 反向用例：验证只有 getter 无 setter 的访问器不能用作对象字面量字段
 */
class Err {
    private _attr: number = 0
    get attr(): number {
        return this._attr
    }
}
const b: Err = {attr: 42}
