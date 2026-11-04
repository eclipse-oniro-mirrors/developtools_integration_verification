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
 * @id EXP_07_11_03_007_FAIL_EXPR_STATIC_METHOD
 * @expect compile-fail
 * @section 7.11.3
 * @design expression.identifier 形式调用静态方法：方法声明 static，应编译时错误
 * @note 反向用例：expression 调用的方法不能是 static，静态方法不符合要求
 */
class MyClass {
    static doSomething(): void {}
}

function main(): void {
    let obj: MyClass = new MyClass()
    obj.doSomething()
}
