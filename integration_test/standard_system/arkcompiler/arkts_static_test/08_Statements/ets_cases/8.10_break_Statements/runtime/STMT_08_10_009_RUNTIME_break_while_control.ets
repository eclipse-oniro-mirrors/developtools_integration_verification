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
 * @id STMT_08_10_009_RUNTIME_break_while_control
 * @expect runtime
 * @section 8.10
 * @design 验证无标签break在while循环中能正确跳出，退出后循环变量和计数器的值正确
 * @note Verify break without label exits while loop immediately and loop variable values are correct
 */
function main(): void {
    let i: int = 0;
    let count: int = 0;
    while (i < 10) {
        if (i == 3) {
            break;
        }
        count++;
        i++;
    }
    if (count != 3) {
        throw new Error("break did not exit while loop at i=3, count=" + count);
    }
    if (i != 3) {
        throw new Error("i should be 3 after break, got " + i);
    }
    console.log("verified");
}
