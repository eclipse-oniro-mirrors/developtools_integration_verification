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
 * @id EXP_07_19_001_PASS_BASIC_NON_NULLISH
 * @expect compile-pass
 * @section 7.19
 * @design 验证 ensure-not-nullish 表达式在非空值上的基本用法编译通过
 * @note 正向用例：非空值类型变量应用 ! 运算符编译通过
 */
class MyClass {
    public v: int = 1
}

function testBasicNonNullish(): void {
    let x: int = 42
    let y: int = x!
}

function testStringNonNullish(): void {
    let s: string = 'hello'
    let t: string = s!
}

function testObjectNonNullish(): void {
    let c: MyClass = new MyClass()
    let d: MyClass = c!
}
