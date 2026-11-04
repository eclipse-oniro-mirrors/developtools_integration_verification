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
 * @id STMT_08_11_005_PASS_continue_with_label_deeply_nested
 * @expect compile-pass
 * @section 8.11
 * @design 验证带标签的continue语句在多层嵌套循环中跳转到中间层和外层标签的混合使用
 * @note continue with labels in deeply nested loops should compile successfully
 */
function testContinueWithLabelDeeplyNested(): void {
    let result: number = 0;
    outer: for (let i: number = 0; i < 5; i++) {
        middle: for (let j: number = 0; j < 5; j++) {
            for (let k: number = 0; k < 5; k++) {
                if (k == 2) {
                    continue middle;
                }
                if (j == 3) {
                    continue outer;
                }
                result++;
            }
        }
    }
}
