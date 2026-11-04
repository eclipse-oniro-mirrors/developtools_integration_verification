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
 * @id STMT_08_11_007_FAIL_continue_with_nonexistent_label
 * @expect compile-fail
 * @section 8.11
 * @design 验证continue语句使用不存在的标签标注时产生编译时错误
 * @note continue with a label that does not match any enclosing loop should be compile-time error
 */
function testContinueWithNonexistentLabel(): void {
    let sum: number = 0;
    for (let i: number = 0; i < 10; i++) {
        // compile-time error: label 'nonexistent' does not match any enclosing loop
        continue nonexistent;
    }
}
