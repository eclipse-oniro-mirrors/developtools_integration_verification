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
 * @id STMT_08_15_2_012_PASS_finally_throw_inside
 * @expect compile-pass
 * @section 8.15.2
 * @design 测试finally块内部抛出异常：语句finally子句可在finally块中使用throw语句。验证finally块中的throw是合法的语法形式，可用于finally块中检测到清理失败等场景。
 * @note 正向测试：finally块中的throw为合法语法，代码应正确编译通过
 */
function testFinallyWithThrowInside(): void {
    try {
        let x: number = 1;
        console.log("try block");
    } catch (e) {
        console.log("catch block");
    } finally {
        // throw inside finally: valid syntax for when cleanup itself fails
        throw new Error("cleanup failed in finally");
    }
}

function testFinallyWithThrowNoCatch(): void {
    try {
        let y: number = 2;
    } finally {
        // throw in finally without catch is also valid
        throw new Error("error in finally only");
    }
}
