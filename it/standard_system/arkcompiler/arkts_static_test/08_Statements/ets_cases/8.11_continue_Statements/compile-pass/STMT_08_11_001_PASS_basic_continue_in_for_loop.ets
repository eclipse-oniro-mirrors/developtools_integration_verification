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
 * @id STMT_08_11_001_PASS_basic_continue_in_for_loop
 * @expect compile-pass
 * @section 8.11
 * @design 验证无标签的continue语句在for循环中的基本用法，跳过偶数次迭代
 * @note continue without label in for loop should compile successfully
 */
function testBasicContinueInForLoop(): void {
    let sum: number = 0;
    for (let i: number = 0; i < 10; i++) {
        if (i % 2 == 0) {
            continue;
        }
        sum += i;
    }
}
