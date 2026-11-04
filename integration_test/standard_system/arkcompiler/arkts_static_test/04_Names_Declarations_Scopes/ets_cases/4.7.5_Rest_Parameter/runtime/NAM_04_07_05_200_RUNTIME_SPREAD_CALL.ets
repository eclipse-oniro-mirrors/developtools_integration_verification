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
 * @id NAM_04_07_05_200_RUNTIME_SPREAD_CALL
 * @expect runtime
 * @section 4.7.5
 * @design spread 数组到 rest 参数运行时正确
 * @note 运行时用例：验证 spread 运算符传递数组给 rest 参数结果正确（§4.7.5 行 1158-1176）
 */
function sum(...numbers: number[]): number {
    let res: number = 0;
    for (let n of numbers) {
        res += n;
    }
    return res;
}
function main(): void {
    let arr: number[] = [1, 2, 3];
    let r: number = sum(...arr);
    if (r != 6) { throw new Error("assertion failed: " + r); }
    console.log("verified");
}
