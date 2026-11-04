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
 * @id STMT_08_11_008_FAIL_continue_with_non_loop_label
 * @expect compile-fail
 * @section 8.11
 * @design 验证continue语句使用非循环语句的标签时产生编译时错误（标签标记的是块语句而非循环）
 * @note continue with a label that refers to a non-loop statement should be compile-time error
 */
function testContinueWithNonLoopLabel(): void {
    let x: number = 0;
    blockLabel: {
        for (let i: number = 0; i < 10; i++) {
            if (i == 5) {
                // compile-time error: label 'blockLabel' is on a block statement, not a loop
                continue blockLabel;
            }
            x++;
        }
    }
}
