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
 * @id NAM_04_06_01_200_RUNTIME_VAR_OPS
 * @expect runtime
 * @section 4.6.1
 * @design 变量运行时读写
 * @note 运行时用例：验证变量声明和读写运行时正确
 */
function main(): void {
    let x: number = 10;
    x = x + 5;
    if (x != 15) {
        throw new Error("assertion failed: " + x);
    }
    console.log("verified");
}
