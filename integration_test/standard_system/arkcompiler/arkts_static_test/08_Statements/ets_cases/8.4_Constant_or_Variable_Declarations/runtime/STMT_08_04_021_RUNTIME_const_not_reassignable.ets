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
 * @id STMT_08_04_021_RUNTIME_const_not_reassignable
 * @expect runtime
 * @section 8.4
 * @design 验证 const 声明的常量在运行时保持其初始值不变
 * @note const 常量初始化为计算表达式的结果，运行时不可被修改（重新赋值是编译时错误）
 */
function main(): void {
    const a: int = 100;
    if (a != 100) {
        throw new Error("const int should be 100");
    }
    const b: string = "constant";
    if (b != "constant") {
        throw new Error("const string should be constant");
    }
    const c: boolean = true;
    if (c != true) {
        throw new Error("const boolean should be true");
    }
    const d: number = 3.14;
    if (d != 3.14) {
        throw new Error("const number should be 3.14");
    }
    let x: int = 1;
    let y: int = 2;
    const e: int = x + y;
    if (e != 3) {
        throw new Error("const expression should be 3");
    }
    let s1: string = "hello";
    let s2: string = "world";
    const f: string = s1 + " " + s2;
    if (f != "hello world") {
        throw new Error("const string expression should be hello world");
    }
    console.log("verified");
}
