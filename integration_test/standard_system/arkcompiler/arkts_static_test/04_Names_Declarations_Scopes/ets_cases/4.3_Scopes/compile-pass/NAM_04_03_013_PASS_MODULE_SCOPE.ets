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
 * @id NAM_04_03_013_PASS_MODULE_SCOPE
 * @expect compile-pass
 * @section 4.3
 * @design 模块作用域编译验证
 * @note 运行时用例：验证模块级变量在函数中运行时访问正确
 */
let shared: number = 100;
function getShared(): number {
    return shared;
}
function main(): void {
    if (getShared() != 100) {
        throw new Error("assertion failed: " + getShared());
    }
    console.log("verified");
}
