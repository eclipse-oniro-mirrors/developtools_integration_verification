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
 * @id STMT_08_01_002_PASS_abrupt_in_try_catch
 * @expect compile-pass
 * @section 8.1
 * @design 验证 try-catch 结构处理异常完成的编译通过：throw语句在try块中产生异常完成，被catch捕获
 * @note 异常完成由 throw 触发，try-catch 是处理异常完成的标准方式
 */
function testTryCatchAbrupt(): void {
    let caught: boolean = false;
    let result: int = 0;
    try {
        result = 1;
        throw new Error("test abrupt");
    } catch (e) {
        caught = true;
    }
    // after try-catch, normal completion resumes
    result = 2;
}

function testTryCatchFinally(): void {
    let cleaned: boolean = false;
    let caught: boolean = false;
    try {
        throw new Error("error");
    } catch (e) {
        caught = true;
    } finally {
        cleaned = true;
    }
}
