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
 * @id STMT_08_12_011_RUNTIME_conditional_multiple_returns
 * @expect runtime
 * @section 8.12
 * @design 运行时验证多个条件return路径返回值正确性
 * @note 运行时测试：验证条件return不同路径的返回值正确，覆盖正数、负数和零的情况
 */
function absValue(x: int): int {
    if (x >= 0) {
        return x;
    }
    return -x;
}

function main(): void {
    let v1: int = absValue(5);
    if (v1 != 5) {
        throw new Error("absValue(5) should be 5, got " + v1);
    }

    let v2: int = absValue(-3);
    if (v2 != 3) {
        throw new Error("absValue(-3) should be 3, got " + v2);
    }

    let v3: int = absValue(0);
    if (v3 != 0) {
        throw new Error("absValue(0) should be 0, got " + v3);
    }

    console.log("verified");
}
