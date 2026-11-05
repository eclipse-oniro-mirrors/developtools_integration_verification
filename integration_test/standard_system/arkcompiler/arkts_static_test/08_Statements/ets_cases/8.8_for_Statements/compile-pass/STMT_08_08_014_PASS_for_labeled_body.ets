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
 * @id STMT_08_08_014_PASS_for_labeled_body
 * @expect compile-pass
 * @section 8.8
 * @design for 循环体使用 labeled statement，支持 break label 跳出外层循环
 * @note 正向用例：outer: for (...) { for (...) { break outer; } } 带标签的 break 跳出外层 for
 */
function testForLabeledBody(): void {
    let sum: int = 0
    outer: for (let i: int = 0; i < 10; i++) {
        for (let j: int = 0; j < 10; j++) {
            sum = sum + 1
            if (sum >= 5) {
                break outer
            }
        }
    }
    console.log(sum)
}
