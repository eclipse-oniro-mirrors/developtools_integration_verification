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
 * @id STMT_08_15_1_003_PASS_catch_finally
 * @expect compile-pass
 * @section 8.15.1
 * @design 验证 try-catch-finally 完整结构编译通过，catch 捕获错误后 finally 确保执行清理逻辑。
 * @note 正向测试：try-catch-finally 三部分完整结构，catch 捕获 Error 对象，finally 块执行清理。
 */
function testCatchFinally(): void {
    let cleanedUp: boolean = false;
    try {
        throw new Error("error with finally");
    } catch (e) {
        let msg: string = e.message;
    } finally {
        cleanedUp = true;
    }
}
