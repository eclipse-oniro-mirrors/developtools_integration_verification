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
 * @id STMT_08_12_004_PASS_return_in_constructor
 * @expect compile-pass
 * @section 8.12
 * @design 测试构造函数中无表达式的return语句
 * @note 正向测试：规范规定构造函数允许使用无表达式的return语句，编译通过
 */
class MyClass {
    x: int = 0;
    constructor() {
        return;
    }
}

function testConstructorReturn(): void {
    let obj: MyClass = new MyClass();
}
