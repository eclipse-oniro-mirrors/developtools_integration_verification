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
 * @id STMT_08_10_005_PASS_break_switch
 * @expect compile-pass
 * @section 8.10
 * @design 在switch语句中使用break跳出case块，防止fallthrough
 * @note break in switch exits the switch block, preventing fallthrough
 */
function testBreakSwitch(): void {
    let x: int = 2;
    let result: string = "";
    switch (x) {
        case 1:
            result = "one";
            break;
        case 2:
            result = "two";
            break;
        default:
            result = "other";
            break;
    }
}
