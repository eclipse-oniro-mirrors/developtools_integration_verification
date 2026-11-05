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
 * @id STMT_08_08_020_RUNTIME_for_countdown
 * @expect runtime
 * @section 8.8
 * @design 运行时验证 for 循环递减计数（forUpdate 使用 i-- 自减表达式）的正确执行行为
 * @note 运行时用例：for (let i = 5; i > 0; i--) 递减求和 5+4+3+2+1，验证 sum == 15
 */
function main(): void {
    let sum: int = 0
    for (let i: int = 5; i > 0; i--) {
        sum = sum + i
    }
    if (sum != 15) {
        throw new Error("countdown for sum failed, expected 15 but got " + sum)
    }
    console.log("verified")
}
