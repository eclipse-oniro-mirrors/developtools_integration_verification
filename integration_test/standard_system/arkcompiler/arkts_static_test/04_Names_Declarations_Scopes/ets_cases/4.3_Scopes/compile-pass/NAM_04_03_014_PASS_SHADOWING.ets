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
 * @id NAM_04_03_014_PASS_SHADOWING
 * @expect compile-pass
 * @section 4.3
 * @design 变量覆盖编译验证
 * @note 运行时用例：验证内层覆盖外层在运行时正确
 */
let value: number = 1;
function testShadow(): number {
    let value: number = 2;
    return value;
}
function main(): void {
    if (testShadow() != 2) {
        throw new Error("assertion failed: " + testShadow());
    }
    console.log("verified");
}
