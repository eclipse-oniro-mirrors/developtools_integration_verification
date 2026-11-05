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
 * @id STMT_08_15_2_005_PASS_finally_nested
 * @expect compile-pass
 * @section 8.15.2
 * @design 测试嵌套的try-catch-finally结构：外层try中包含内层try-catch-finally，内层finally执行后外层finally仍执行。验证多层嵌套场景下finally子句的编译正确性。
 * @note 正向测试：嵌套finally的复杂场景，验证编译器对多层作用域的处理
 */
function testNestedFinally(): void {
    let outerResult: number = 0;
    let innerResult: number = 0;
    try {
        try {
            innerResult = 1;
        } catch (e) {
            innerResult = 2;
        } finally {
            innerResult = 3;
        }
        outerResult = 10;
    } finally {
        outerResult = outerResult + innerResult;
    }
    if (innerResult != 3 || outerResult != 13) {
        console.log("FAIL: inner=" + innerResult + " outer=" + outerResult);
    }
}
