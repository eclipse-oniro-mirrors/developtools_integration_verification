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
 * @id STMT_08_01_001_PASS_normal_completion
 * @expect compile-pass
 * @section 8.1
 * @design 验证各类语句正常完成的编译通过：赋值语句、表达式语句、块语句、if语句、for循环等均正常完成
 * @note 正常完成是语句默认行为，所有常见语句结构均应编译通过
 */
function testNormalCompletion(): void {
    let x: int = 0;
    // assignment statement completes normally
    x = 1;
    // expression statement completes normally
    x + 1;
    // block completes normally
    {
        let y: int = 2;
        y = x + y;
    }
    // if-else completes normally
    if (x > 0) {
        x = 2;
    } else {
        x = 3;
    }
    // for loop completes normally
    let sum: int = 0;
    for (let i: int = 0; i < 5; i++) {
        sum = sum + i;
    }
    // while loop completes normally
    let j: int = 0;
    while (j < 3) {
        j++;
    }
    // do-while loop completes normally
    let k: int = 0;
    do {
        k++;
    } while (k < 3);
    // empty statement
    ;
    // empty block
    {
    }
}
