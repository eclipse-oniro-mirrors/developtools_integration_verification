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
 * @id STMT_08_07_005_PASS_nested_loops
 * @expect compile-pass
 * @section 8.7
 * @design while 和 do-while 循环互相嵌套，验证多层嵌套合法
 * @note while 内部可以嵌套 do-while，do-while 内部可以嵌套 while
 */
function testNestedLoops(): void {
    let i: int = 0;
    let result: int = 0;
    // while nested in while
    while (i < 3) {
        let j: int = 0;
        while (j < 2) {
            result = result + 1;
            j = j + 1;
        }
        i = i + 1;
    }
    // do-while nested in do-while
    let a: int = 0;
    do {
        let b: int = 0;
        do {
            result = result + 1;
            b = b + 1;
        } while (b < 2);
        a = a + 1;
    } while (a < 2);
    // while nested in do-while
    let c: int = 0;
    do {
        let d: int = 0;
        while (d < 3) {
            result = result + 1;
            d = d + 1;
        }
        c = c + 1;
    } while (c < 2);
}
