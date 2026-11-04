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
 * @id STMT_08_11_010_FAIL_continue_with_label_on_non_loop_block
 * @expect compile-fail
 * @section 8.11
 * @design 验证continue语句使用的标签标记在非循环语句（普通块语句）上时产生编译时错误
 * @note label on a plain block {} is not a loopStatement; continue blockLabel is a compile-time error per STATEMENTS.md line 343-345
 */
function testContinueWithLabelOnNonLoopBlock(): void {
    for (let i: number = 0; i < 5; i++) {
        blockLabel: {
            if (i == 2) {
                // compile-time error: blockLabel is on a block, not a loop statement
                continue blockLabel;
            }
        }
    }
}
