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
 * @id STMT_08_15_3_002_PASS_try_catch_error_handled
 * @expect compile-pass
 * @section 8.15.3
 * @design 验证规则2：try 块抛出异常 x，catch 子句被执行，catch 体正常完成，整个 try 语句正常完成。
 * @note 正向测试：try 中抛出 Error，catch 捕获后正常处理，catch 体无异常抛出，整个 try 表现为正常完成。
 */
function testTryCatchErrorHandled(): void {
    let result: int = 0;
    try {
        throw new Error("test error");
        result = 1;
    } catch (e) {
        result = 2;
    }
}
