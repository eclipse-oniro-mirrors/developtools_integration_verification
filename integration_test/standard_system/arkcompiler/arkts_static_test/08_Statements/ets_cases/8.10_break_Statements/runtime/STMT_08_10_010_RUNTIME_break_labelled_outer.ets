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
 * @id STMT_08_10_010_RUNTIME_break_labelled_outer
 * @expect runtime
 * @section 8.10
 * @design 验证带标签的break能正确跳出外层标记循环，跳过内层剩余迭代
 * @note Verify break with label exits the outer labeled loop, skipping remaining inner iterations
 */
function main(): void {
    let i: int = 0;
    let j: int = 0;
    outer: for (i = 0; i < 5; i++) {
        for (j = 0; j < 5; j++) {
            if (j == 2) {
                break outer;
            }
        }
    }
    // After break outer: outer loop iteration stays at i=0, inner loop stopped at j=2
    if (i != 0) {
        throw new Error("Expected i=0 after break outer, got " + i);
    }
    if (j != 2) {
        throw new Error("Expected j=2 after break outer, got " + j);
    }
    console.log("verified");
}
