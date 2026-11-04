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
 * @id NAM_04_07_07_200_RUNTIME_FUNC_RETURN
 * @expect runtime
 * @section 4.7.7
 * @design 函数返回类型运行时
 * @note 运行时用例：验证函数返回类型在运行时的正确性
 */
function makeGreeting(name: string): string {
    return "Hello, " + name;
}
function main(): void {
    if (makeGreeting("ArkTS") != "Hello, ArkTS") {
        throw new Error("assertion failed: " + makeGreeting("ArkTS"));
    }
    console.log("verified");
}
