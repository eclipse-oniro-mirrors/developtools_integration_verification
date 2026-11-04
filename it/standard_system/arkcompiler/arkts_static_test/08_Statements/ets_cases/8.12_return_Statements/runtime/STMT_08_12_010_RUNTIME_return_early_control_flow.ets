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
 * @id STMT_08_12_010_RUNTIME_return_early_control_flow
 * @expect runtime
 * @section 8.12
 * @design 运行时验证void函数中return语句提前退出控制流
 * @note 运行时测试：验证return语句后的代码不会被执行，通过sideEffect变量检测
 */
let sideEffect: int = 0;

function testReturnEarly(): void {
    sideEffect = 1;
    return;
    // unreachable code follows
    sideEffect = 2;
}

function main(): void {
    testReturnEarly();
    if (sideEffect != 1) {
        throw new Error("sideEffect should be 1 after testReturnEarly, got " + sideEffect);
    }

    console.log("verified");
}
