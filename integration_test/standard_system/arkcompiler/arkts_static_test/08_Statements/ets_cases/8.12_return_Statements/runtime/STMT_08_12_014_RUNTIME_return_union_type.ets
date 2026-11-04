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
 * @id STMT_08_12_014_RUNTIME_return_union_type
 * @expect runtime
 * @section 8.12
 * @design 运行时验证返回类型为union(T|undefined)的函数中return语句行为
 * @note 运行时测试：验证返回具体值和返回undefined的运行时语义，确认union返回类型函数正常工作
 */

function safeDivide(a: int, b: int): int | undefined {
    if (b == 0) {
        return;
    }
    return a / b;
}

function lookup(arr: string[], target: string): string | undefined {
    for (let i: int = 0; i < arr.length; i++) {
        if (arr[i] == target) {
            return "found:" + arr[i];
        }
    }
    return;
}

function main(): void {
    let r1: int | undefined = safeDivide(10, 2);
    if (r1 != 5) {
        throw new Error("safeDivide(10,2) should be 5, got " + r1);
    }

    let r2: int | undefined = safeDivide(10, 0);
    if (r2 != undefined) {
        throw new Error("safeDivide(10,0) should be undefined, got " + r2);
    }

    let words: string[] = ["apple", "banana", "cherry"];
    let r3: string | undefined = lookup(words, "banana");
    if (r3 != "found:banana") {
        throw new Error("lookup for banana failed, got " + r3);
    }

    let r4: string | undefined = lookup(words, "grape");
    if (r4 != undefined) {
        throw new Error("lookup for grape should be undefined, got " + r4);
    }

    console.log("verified");
}
