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
 * @id STMT_08_11_010_RUNTIME_continue_with_label_nested_loops
 * @expect runtime
 * @section 8.11
 * @design 验证嵌套循环中使用带标签的continue跳转到外层循环的运行时行为
 * @note runtime test: continue with label in nested loops should transfer to outer loop's next iteration
 */
function main(): void {
    let result: string = "";
    outer: for (let i: number = 0; i < 3; i++) {
        for (let j: number = 0; j < 3; j++) {
            if (j == 1) {
                continue outer;
            }
            result = result + i + "," + j + ";";
        }
    }
    // Expected: only j=0 executes before continuing outer each time
    // i=0,j=0 -> i=1,j=0 -> i=2,j=0
    // Result: "0,0;1,0;2,0;"
    let expected: string = "0,0;1,0;2,0;";
    if (result != expected) {
        throw new Error("continue with label did not jump to outer loop correctly, got=" + result);
    }
    console.log("verified");
}
