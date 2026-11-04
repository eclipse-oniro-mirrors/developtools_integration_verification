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
 * @id STMT_08_13_018_PASS_boolean_switch_extended
 * @expect compile-pass
 * @section 8.13
 * @design boolean类型switch表达式的扩展用法：仅含true case无false case（编译通过）、仅含false case加default、fall-through穿越布尔分支
 * @note 扩展覆盖 boolean switch 的边界场景：单分支（无全覆盖）、fall-through 两个分支连续执行
 */
function testBooleanSwitchSingleCase(): void {
    let flag: boolean = true;
    let result: string = "";
    switch (flag) {
        case true:
            result = "only_true";
            break;
        default:
            result = "default_false";
            break;
    }
}

function testBooleanSwitchFallThrough(): void {
    let flag: boolean = true;
    let result: string = "";
    switch (flag) {
        case true:
            result = "true";
        case false:
            result = result + "_then_false";
            break;
        default:
            result = "default";
            break;
    }
}
