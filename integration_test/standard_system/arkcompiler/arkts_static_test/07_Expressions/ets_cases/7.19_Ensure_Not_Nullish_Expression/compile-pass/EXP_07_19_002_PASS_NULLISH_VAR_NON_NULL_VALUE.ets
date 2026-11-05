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
 * @id EXP_07_19_002_PASS_NULLISH_VAR_NON_NULL_VALUE
 * @expect compile-pass
 * @section 7.19
 * @design 验证空值类型变量持有非空值时 ! 编译通过
 * @note 正向用例：T | undefined 类型变量持有非空值，应用 ! 后类型窄化为 T
 */
function testUndefinedUnion(): void {
    let x: int | undefined = 42
    let y: int = x!
}

function testNullUnion(): void {
    let x: int | null = 100
    let y: int = x!
}

function testStringUndefined(): void {
    let s: string | undefined = 'hello'
    let t: string = s!
}
