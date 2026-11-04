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
 * @id EXP_07_09_001_PASS_INSTANCE_METHOD_THIS
 * @expect compile-pass
 * @section 7.9
 * @design 类实例方法中使用 this：this.field 访问当前对象字段，this.method() 调用当前方法
 * @note 正向用例：验证 this 在实例方法中可正常引用当前对象
 */
class MyClass {
    public value: int = 42
    getValue(): int {
        return this.value
    }
    twice(): int {
        return this.getValue() * 2
    }
}
let x: MyClass = new MyClass()
let v: int = x.twice()
