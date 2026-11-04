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
 * @id STMT_08_15_2_002_PASS_finally_after_catch
 * @expect compile-pass
 * @section 8.15.2
 * @design 测试在try块抛出异常后，catch块捕获异常并处理，finally块在catch之后仍然执行。验证catch块存在时finally子句仍能正确编译。
 * @note 正向测试：try抛异常 -> catch捕获 -> finally执行，验证三者协作编译通过
 */
function testFinallyAfterCatch(): void {
    let result: string = "start";
    try {
        throw new Error("test error");
    } catch (e) {
        result = "caught";
    } finally {
        result = result + "_finally";
    }
    if (result != "caught_finally") {
        console.log("FAIL: unexpected result " + result);
    }
}
