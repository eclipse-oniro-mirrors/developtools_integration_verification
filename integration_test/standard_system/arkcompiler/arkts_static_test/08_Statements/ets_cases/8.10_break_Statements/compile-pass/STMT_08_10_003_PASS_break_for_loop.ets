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
 * @id STMT_08_10_003_PASS_break_for_loop
 * @expect compile-pass
 * @section 8.10
 * @design 在for循环中使用无标签break，跳出for循环
 * @note break without label exits the innermost for loop
 */
function testBreakForLoop(): void {
    let sum: int = 0;
    for (let i: int = 0; i < 10; i++) {
        if (i == 5) {
            break;
        }
        sum += i;
    }
}
