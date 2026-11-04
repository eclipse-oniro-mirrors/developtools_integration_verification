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
 * @id NAM_04_07_04_201_RUNTIME_QMARK_COMPARISON
 * @expect runtime
 * @section 4.7.4
 * @design ? 短格式与显式 `T | undefined = undefined` 等价
 * @note 运行时用例：验证 spec 中可选参数 ? 形式与显式形式的运行时行为一致（§4.7.4 行 1046-1084）
 */
function hello1(name: string | undefined = undefined): string {
    if (name == undefined) { return "no name"; }
    return name;
}
function hello2(name?: string): string {
    if (name == undefined) { return "no name"; }
    return name;
}
function foo1(p?: number): number {
    if (p == undefined) { return -1; }
    return p;
}
function foo2(p: number | undefined = undefined): number {
    if (p == undefined) { return -1; }
    return p;
}
function main(): void {
    if (hello1() != "no name") { throw new Error("assertion failed"); }
    if (hello1("John") != "John") { throw new Error("assertion failed"); }
    if (hello2() != "no name") { throw new Error("assertion failed"); }
    if (hello2("John") != "John") { throw new Error("assertion failed"); }
    if (foo1() != -1) { throw new Error("assertion failed"); }
    if (foo1(5) != 5) { throw new Error("assertion failed"); }
    if (foo2() != -1) { throw new Error("assertion failed"); }
    if (foo2(5) != 5) { throw new Error("assertion failed"); }
    console.log("verified");
}
