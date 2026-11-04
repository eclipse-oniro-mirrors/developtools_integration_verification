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
 * @id STMT_08_15_2_001_PASS_basic_finally
 * @expect compile-pass
 * @section 8.15.2
 * @design 测试基本的try-catch-finally结构：try块正常执行，catch块不触发，finally块在try之后执行。验证finally子句在正常完成时能够正确编译和执行。
 * @note 正向测试：基础的try-catch-finally语法结构，代码应正确编译通过
 */
function testBasicFinally(): void {
    let result: number = 0;
    try {
        result = 1;
    } catch (e) {
        result = 2;
    } finally {
        result = 3;
    }
    if (result != 3) {
        console.log("FAIL: result should be 3 but got " + result);
    }
}
