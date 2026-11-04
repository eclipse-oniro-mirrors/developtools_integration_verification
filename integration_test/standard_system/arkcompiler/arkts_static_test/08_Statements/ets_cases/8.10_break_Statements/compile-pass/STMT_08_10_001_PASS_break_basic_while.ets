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
 * @id STMT_08_10_001_PASS_break_basic_while
 * @expect compile-pass
 * @section 8.10
 * @design 在while循环中使用无标签break，跳出最内层循环
 * @note break without label exits the innermost while loop
 */
function testBreakBasicWhile(): void {
    let i: int = 0;
    while (i < 10) {
        if (i == 5) {
            break;
        }
        i++;
    }
}
