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
 * @id STMT_08_11_002_PASS_continue_with_label_in_nested_for
 * @expect compile-pass
 * @section 8.11
 * @design 验证带标签的continue语句在嵌套for循环中跳转到外层循环的下一次迭代
 * @note continue with label in nested for loop should compile successfully
 */
function testContinueWithLabelInNestedFor(): void {
    let result: number = 0;
    outer: for (let i: number = 0; i < 3; i++) {
        for (let j: number = 0; j < 3; j++) {
            if (j == 1) {
                continue outer;
            }
            result++;
        }
    }
}
