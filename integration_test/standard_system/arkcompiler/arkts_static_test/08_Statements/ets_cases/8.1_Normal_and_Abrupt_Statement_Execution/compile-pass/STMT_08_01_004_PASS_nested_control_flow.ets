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
 * @id STMT_08_01_004_PASS_nested_control_flow
 * @expect compile-pass
 * @section 8.1
 * @design 验证嵌套控制流结构中正常完成与异常完成的混合使用：循环嵌套try-catch，循环嵌套条件判断
 * @note 嵌套语句中异常完成被内层catch捕获后，外层恢复正常完成
 */
function testNestedTryInLoop(): void {
    let result: int = 0;
    for (let i: int = 0; i < 3; i++) {
        try {
            if (i == 1) {
                throw new Error("skip iteration");
            }
            result = result + i;
        } catch (e) {
            // abrupt completion handled, loop continues normally
        }
    }
}

function testNestedLoopBreakContinue(): void {
    let result: string = "";
    outer: for (let i: int = 0; i < 3; i++) {
        for (let j: int = 0; j < 3; j++) {
            if (i == 1 && j == 1) {
                continue outer;
            }
            if (i == 2 && j == 2) {
                break outer;
            }
        }
    }
}

function testIfInsideTryInsideIf(): void {
    let x: int = 0;
    if (true) {
        try {
            if (x == 0) {
                x = 10;
            }
        } catch (e) {
            // not reached
        }
    }
}
