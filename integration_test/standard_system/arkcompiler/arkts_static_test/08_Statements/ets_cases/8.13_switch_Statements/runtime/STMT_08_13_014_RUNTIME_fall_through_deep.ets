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
 * @id STMT_08_13_014_RUNTIME_fall_through_deep
 * @expect runtime
 * @section 8.13
 * @design switch 的多层 fall-through 穿透执行和穿透到 default 的行为 — STATEMENTS.md lines 476-478
 * @note 运行时验证：连续多个 case 无 break 穿透；无 default 时穿透到 switch 结束；穿透到 default 子句
 */
function main(): void {
    // Test 1: fall-through across 3 consecutive cases without break
    let x: int = 0;
    let result: string = "";
    switch (x) {
        case 0:
            result += "A";
        case 1:
            result += "B";
        case 2:
            result += "C";
            break;
        case 3:
            result += "D";
            break;
        default:
            result = "default";
            break;
    }
    if (result != "ABC") {
        throw new Error("Test 1 deep fall-through failed: expected 'ABC', got '" + result + "'");
    }

    // Test 2: fall-through into default clause (no case matches, but fall-through from last case into default)
    let y: int = 1;
    let result2: string = "";
    switch (y) {
        case 0:
            result2 += "X";
            break;
        case 1:
            result2 += "Y";
        case 2:
            result2 += "Z";
        default:
            result2 += "_default";
            break;
    }
    if (result2 != "YZ_default") {
        throw new Error("Test 2 fall-through into default failed: expected 'YZ_default', got '" + result2 + "'");
    }

    // Test 3: switch without default — fall-through runs to end of switch
    let z: int = 10;
    let result3: string = "";
    switch (z) {
        case 10:
            result3 += "ten";
        case 20:
            result3 += "_twenty";
            break;
    }
    if (result3 != "ten_twenty") {
        throw new Error("Test 3 fall-through no-default failed: expected 'ten_twenty', got '" + result3 + "'");
    }

    // Test 4: match mid-chain with fall-through — matching at case 1, falling through 2 to 3 which has break
    let w: int = 2;
    let result4: string = "";
    switch (w) {
        case 1:
            result4 += "skip";
        case 2:
            result4 += "MATCH";
        case 3:
            result4 += "_THREE";
            break;
        case 4:
            result4 += "_four";
            break;
    }
    if (result4 != "MATCH_THREE") {
        throw new Error("Test 4 mid-chain fall-through failed: expected 'MATCH_THREE', got '" + result4 + "'");
    }

    console.log("verified");
}
