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
 * @id STMT_08_13_010_RUNTIME_fall_through_and_default
 * @expect runtime
 * @section 8.13
 * @design 验证switch的fall-through无break穿透执行行为和default子句的匹配/未匹配行为
 * @note 运行时验证case无break时穿透执行后续case语句，default仅在未匹配时执行，匹配时跳过default
 */
function main(): void {
    // Test fall-through: case 1 has no break, falls through to case 2
    let x: int = 1;
    let result: string = "";
    switch (x) {
        case 1:
            result = "a";
        case 2:
            result += "b";
            break;
        case 3:
            result += "c";
            break;
        default:
            result = "default";
            break;
    }
    if (result != "ab") {
        throw new Error("Fall-through failed: expected 'ab', got " + result);
    }

    // Test default when no case matches
    let y: int = 99;
    let result2: string = "";
    switch (y) {
        case 1:
            result2 = "one";
            break;
        case 2:
            result2 = "two";
            break;
        default:
            result2 = "default_reached";
            break;
    }
    if (result2 != "default_reached") {
        throw new Error("Default not reached: expected 'default_reached', got " + result2);
    }

    // Test match prevents default execution
    let z: int = 2;
    let result3: string = "";
    switch (z) {
        case 1:
            result3 = "one";
            break;
        case 2:
            result3 = "two_matched";
            break;
        default:
            result3 = "default";
            break;
    }
    if (result3 != "two_matched") {
        throw new Error("Match not working: expected 'two_matched', got " + result3);
    }

    console.log("verified");
}
