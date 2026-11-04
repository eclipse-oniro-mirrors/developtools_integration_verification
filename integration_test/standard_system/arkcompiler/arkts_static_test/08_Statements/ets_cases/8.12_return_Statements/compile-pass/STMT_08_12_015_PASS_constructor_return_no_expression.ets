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
 * @id STMT_08_12_015_PASS_constructor_return_no_expression
 * @expect compile-pass
 * @section 8.12
 * @design 测试带参数的构造函数中无表达式的return语句 — STATEMENTS.md: constructor return 允许无表达式形式
 * @note 正向测试：规范规定构造函数体内允许使用无表达式的return语句（plain return），即使构造函数有参数也合法；但return undefined在构造函数中禁止
 */
class Widget {
    public id: int;
    public label: string = ""
    constructor(id: int, label: string) {
        if (id < 0) {
            return;
        }
        this.id = id;
        this.label = label;
    }
}

function testConstructorWithParamReturn(): void {
    let w: Widget = new Widget(1, "button");
}
