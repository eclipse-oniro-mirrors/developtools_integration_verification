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
 * @id STMT_08_13_020_RUNTIME_string_switch_matching
 * @expect runtime
 * @section 8.13
 * @design 运行时验证string类型switch的case精确匹配、default兜底、以及无匹配无default时跳过switch
 * @note 验证三个场景：精确case匹配、未匹配时default执行、无匹配无default时switch体无操作
 */
function main(): void {
    // Test 1: exact case match
    let s: string = "world";
    let result: string = "";
    switch (s) {
        case "hello":
            result = "greeting";
            break;
        case "world":
            result = "planet";
            break;
        case "ArkTS":
            result = "language";
            break;
        default:
            result = "unknown";
            break;
    }
    if (result != "planet") {
        throw new Error("String case match failed: expected 'planet', got " + result);
    }

    // Test 2: no match falls to default
    let s2: string = "foo";
    let result2: string = "";
    switch (s2) {
        case "hello":
            result2 = "greeting";
            break;
        case "world":
            result2 = "planet";
            break;
        default:
            result2 = "default_hit";
            break;
    }
    if (result2 != "default_hit") {
        throw new Error("Default not reached: expected 'default_hit', got " + result2);
    }

    // Test 3: no match and no default — switch body does nothing
    let s3: string = "unmatched";
    let result3: string = "untouched";
    switch (s3) {
        case "hello":
            result3 = "changed";
            break;
        case "world":
            result3 = "changed";
            break;
    }
    if (result3 != "untouched") {
        throw new Error("Expected untouched when no match and no default, got " + result3);
    }

    // Test 4: empty string case
    let s4: string = "";
    let result4: string = "";
    switch (s4) {
        case "":
            result4 = "empty_matched";
            break;
        default:
            result4 = "default";
            break;
    }
    if (result4 != "empty_matched") {
        throw new Error("Empty string case match failed: expected 'empty_matched', got " + result4);
    }

    console.log("verified");
}
