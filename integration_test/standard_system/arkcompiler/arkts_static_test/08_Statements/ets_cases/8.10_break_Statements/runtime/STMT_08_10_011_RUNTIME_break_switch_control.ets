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
 * @id STMT_08_10_011_RUNTIME_break_switch_control
 * @expect runtime
 * @section 8.10
 * @design 验证break在switch语句中能正确跳出case块，防止fallthrough到下一个case
 * @note Verify break in switch prevents fallthrough between case clauses
 */
function main(): void {
    let x: int = 2;
    let result: string = "";
    switch (x) {
        case 1:
            result = "one";
            break;
        case 2:
            result = "two";
            break;
        case 3:
            result = "three";
            break;
        default:
            result = "default";
            break;
    }
    if (result != "two") {
        throw new Error("Expected result 'two', got '" + result + "'");
    }
    console.log("verified");
}
