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
 * @id STMT_08_13_009_RUNTIME_basic_switch
 * @expect runtime
 * @section 8.13
 * @design 验证switch基本匹配执行流程：正确匹配case执行对应分支，未匹配时执行default子句
 * @note 运行时验证int switch的case匹配行为、break正确退出，以及未匹配时default的执行
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
        throw new Error("Case 2 match failed: expected 'two', got " + result);
    }

    // Test no match goes to default
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
            result2 = "default_matched";
            break;
    }
    if (result2 != "default_matched") {
        throw new Error("Default not reached: expected 'default_matched', got " + result2);
    }

    console.log("verified");
}
