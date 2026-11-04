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
 * @id STMT_08_01_008_RUNTIME_normal_completion_flow
 * @expect runtime
 * @section 8.1
 * @design 验证正常完成的语句按预期顺序执行并产生正确结果
 * @note 赋值、条件、循环等语句正常完成时，执行流按序推进，变量状态符合预期
 */
function main(): void {
    // Test 1: sequential assignment normal completion
    let a: int = 1;
    a = a + 2;
    a = a * 3;
    if (a != 9) {
        throw new Error("normal completion: sequential assignment failed, expected 9 but got " + a);
    }

    // Test 2: if-else normal completion
    let b: int = 0;
    if (true) {
        b = 100;
    } else {
        b = 200;
    }
    if (b != 100) {
        throw new Error("normal completion: if-true branch failed, expected 100 but got " + b);
    }

    // Test 3: for loop normal completion
    let sum: int = 0;
    for (let i: int = 0; i < 5; i++) {
        sum = sum + i;
    }
    if (sum != 10) {
        throw new Error("normal completion: for loop sum failed, expected 10 but got " + sum);
    }

    // Test 4: while loop normal completion
    let count: int = 0;
    let j: int = 0;
    while (j < 3) {
        count = count + 1;
        j++;
    }
    if (count != 3) {
        throw new Error("normal completion: while loop count failed, expected 3 but got " + count);
    }

    // Test 5: empty statements and blocks complete normally
    let x: int = 1;
    {
        // empty block
    }
    ;
    x = 2;
    if (x != 2) {
        throw new Error("normal completion: after empty block, expected 2 but got " + x);
    }

    console.log("verified");
}
