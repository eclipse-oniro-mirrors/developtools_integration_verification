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
 * @id NAM_04_07_04_200_RUNTIME_OPTIONAL_DEFAULT
 * @expect runtime
 * @section 4.7.4
 * @design 可选参数默认值运行时
 * @note 运行时用例：验证可选参数默认值在省略时生效
 */
function pair(x: number, y: number = 7): number {
    return x + y;
}
function main(): void {
    let r1 = pair(1, 2);
    if (r1 != 3) {
        throw new Error("assertion failed: " + r1);
    }
    let r2 = pair(1);
    if (r2 != 8) {
        throw new Error("assertion failed: " + r2);
    }
    let r3 = pair(1, undefined);
    if (r3 != 8) {
        throw new Error("assertion failed: " + r3);
    }
    console.log("verified");
}
