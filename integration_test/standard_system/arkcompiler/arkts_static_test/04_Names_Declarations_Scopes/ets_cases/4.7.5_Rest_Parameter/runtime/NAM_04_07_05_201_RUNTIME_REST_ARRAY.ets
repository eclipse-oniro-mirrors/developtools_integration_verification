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
 * @id NAM_04_07_05_201_RUNTIME_REST_ARRAY
 * @expect runtime
 * @section 4.7.5
 * @design rest参数运行时
 * @note 运行时用例：验证 rest 参数运行时行为正确
 */
function sum(...numbers: number[]): number {
    let res: number = 0;
    for (let n of numbers) {
        res += n;
    }
    return res;
}
function main(): void {
    let r1 = sum();
    if (r1 != 0) {
        throw new Error("assertion failed: " + r1);
    }
    let r2 = sum(1);
    if (r2 != 1) {
        throw new Error("assertion failed: " + r2);
    }
    let r3 = sum(1, 2, 3);
    if (r3 != 6) {
        throw new Error("assertion failed: " + r3);
    }
    console.log("verified");
}
