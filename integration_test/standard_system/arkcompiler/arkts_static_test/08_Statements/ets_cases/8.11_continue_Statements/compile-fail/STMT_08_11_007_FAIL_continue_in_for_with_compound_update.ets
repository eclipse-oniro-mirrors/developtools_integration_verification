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
 * @id STMT_08_11_007_FAIL_continue_in_for_with_compound_update
 * @expect compile-fail
 * @section 8.11
 * @design 验证for循环中continue语句与复合（逗号分隔）forUpdate表达式一起正确编译
 * @note continue in for loop must still execute all parts of compound update expression before re-evaluating condition
 */
function testContinueInForWithCompoundUpdate(): void {
    let sum: number = 0;
    let updateTracker: number = 0;
    for (let i: number = 0; i < 10; (updateTracker++, i++)) {
        if (i % 2 == 0) {
            continue;
        }
        sum += i;
    }
}
