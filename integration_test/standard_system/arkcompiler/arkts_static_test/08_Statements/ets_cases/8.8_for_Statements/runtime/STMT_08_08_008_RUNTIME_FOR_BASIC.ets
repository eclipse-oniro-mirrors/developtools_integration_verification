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
 * @id STMT_08_08_008_RUNTIME_FOR_BASIC
 * @expect runtime
 * @section 8.8
 * @design 基础 for 循环运行时行为：遍历 i=0..4 求和，验证结果正确
 * @note 运行时用例：for (let i: int = 0; i < 5; i++) 求和
 */
function main(): void {
    let sum: int = 0
    for (let i: int = 0; i < 5; i++) {
        sum = sum + i
    }
    if (sum != 10) {
        throw new Error("basic for sum failed, expected 10 but got " + sum)
    }
    console.log("verified")
}
