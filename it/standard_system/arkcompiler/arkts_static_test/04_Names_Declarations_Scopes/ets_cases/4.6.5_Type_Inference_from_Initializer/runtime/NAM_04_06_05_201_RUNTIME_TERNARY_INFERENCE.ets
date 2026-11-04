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
 * @id NAM_04_06_05_201_RUNTIME_TERNARY_INFERENCE
 * @expect runtime
 * @section 4.6.5
 * @design 三元条件表达式推断类型运行时值正确
 * @note 运行时用例：验证 spec 中三元条件类型推断（§4.6.5 行 758-844）运行时值正确
 */
function main(): void {
    let c1: boolean = true ? true : false;
    if (c1 != true) { throw new Error("assertion failed"); }
    let c2: boolean = false ? true : false;
    if (c2 != false) { throw new Error("assertion failed"); }
    let oneOrTwo: number = true ? 1 : 2;
    if (oneOrTwo != 1) { throw new Error("assertion failed: " + oneOrTwo); }
    let threeOrPi: number = true ? 3 : 3.14;
    if (threeOrPi != 3) { throw new Error("assertion failed: " + threeOrPi); }
    let pi: number = false ? 3 : 3.14;
    if (pi != 3.14) { throw new Error("assertion failed: " + pi); }
    let strCond: string = true ? "one" : "two";
    if (strCond != "one") { throw new Error("assertion failed: " + strCond); }
    let intOrStr: string = false ? 1 : "one";
    if (intOrStr != "one") { throw new Error("assertion failed: " + intOrStr); }
    let x1: number = 1;
    if (x1 != 1) { throw new Error("assertion failed"); }
    const x2: number = 1;
    if (x2 != 1) { throw new Error("assertion failed"); }
    let s1: string = "1";
    if (s1 != "1") { throw new Error("assertion failed"); }
    const s2: string = "1";
    if (s2 != "1") { throw new Error("assertion failed"); }
    console.log("verified");
}
