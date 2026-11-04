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
 * @id EXP_07_09_003_PASS_FIELD_LAMBDA_THIS
 * @expect compile-pass
 * @section 7.9
 * @design 字段初始化 lambda 中使用 this：lambda 体内 this 引用该字段所属的类实例
 * @note 正向用例：验证字段初始化器中 lambda 表达式的 this 类型
 */
class MyClass {
    public value: int = 10
    public getValue: () => int = (): int => {
        return this.value
    }
}
let x: MyClass = new MyClass()
let v: int = x.getValue()
