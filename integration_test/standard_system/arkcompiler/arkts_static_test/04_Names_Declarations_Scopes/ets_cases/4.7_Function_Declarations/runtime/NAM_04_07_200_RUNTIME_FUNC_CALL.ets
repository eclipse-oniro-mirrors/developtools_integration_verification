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
 * @id NAM_04_07_200_RUNTIME_FUNC_CALL
 * @expect runtime
 * @section 4.7
 * @design 函数调用运行时
 * @note 运行时用例：验证函数调用执行正确
 */
function add(a: number, b: number): number {
    return a + b;
}
function main(): void {
    if (add(3, 4) != 7) {
        throw new Error("assertion failed: " + add(3, 4));
    }
    console.log("verified");
}
