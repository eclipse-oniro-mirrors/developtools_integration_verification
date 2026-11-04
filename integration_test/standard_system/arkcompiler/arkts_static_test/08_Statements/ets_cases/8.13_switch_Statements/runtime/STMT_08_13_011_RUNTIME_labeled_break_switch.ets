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
 * @id STMT_08_13_011_RUNTIME_labeled_break_switch
 * @expect runtime
 * @section 8.13
 * @design 验证带标签标识符的switch中break outer跳出嵌套switch到外层switch的功能
 * @note 运行时验证outer:标签下嵌套switch中使用break outer跳出外层switch，以及普通break仅退出内层switch
 */
function main(): void {
    // Test labeled break: break outer exits the outer switch entirely
    let x: int = 1;
    let y: int = 2;
    let result: string = "";
    outer: switch (x) {
        case 1:
            switch (y) {
                case 2:
                    result = "inner_break_outer";
                    break outer;
                default:
                    result = "inner_default";
                    break;
            }
            result = "should_not_reach";
            break;
        default:
            result = "outer_default";
            break;
    }
    if (result != "inner_break_outer") {
        throw new Error("Labeled break outer failed: expected 'inner_break_outer', got " + result);
    }

    // Test normal break (without label): only exits inner switch, continues in outer
    let a: int = 1;
    let b: int = 2;
    let result2: string = "";
    switch (a) {
        case 1:
            switch (b) {
                case 2:
                    result2 = "inner_break";
                    break;
                default:
                    result2 = "inner_default";
                    break;
            }
            result2 += "_after_inner";
            break;
        default:
            result2 = "outer_default";
            break;
    }
    if (result2 != "inner_break_after_inner") {
        throw new Error("Normal break failed: expected 'inner_break_after_inner', got " + result2);
    }

    console.log("verified");
}
