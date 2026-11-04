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
 * @id EXP_07_09_004_PASS_OBJECT_LITERAL_METHOD_THIS
 * @expect compile-pass
 * @section 7.9
 * @design 对象字面量方法中使用 this：对象字面量的方法中 this 类型为对象字面量类型
 * @note 正向用例：验证对象字面量方法中的 this 引用
 */
interface HasValue {
    value: int
    getValue(): int
}
class MyClass implements HasValue {
    public value: int = 42
    getValue(): int {
        return this.value
    }
}
let obj: HasValue = {
    value: 100,
    getValue(): int {
        return this.value
    }
}
let v: int = obj.getValue()
