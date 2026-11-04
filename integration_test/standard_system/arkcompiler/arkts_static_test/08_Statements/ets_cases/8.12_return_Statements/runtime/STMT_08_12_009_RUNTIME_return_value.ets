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
 * @id STMT_08_12_009_RUNTIME_return_value
 * @expect runtime
 * @section 8.12
 * @design 运行时验证return语句正确返回值
 * @note 运行时测试：验证函数返回值与期望值一致，覆盖int和string类型
 */
function add(a: int, b: int): int {
    return a + b;
}

function getGreeting(name: string): string {
    return "Hello, " + name;
}

function main(): void {
    let sum: int = add(3, 4);
    if (sum != 7) {
        throw new Error("add(3,4) should be 7, got " + sum);
    }

    let msg: string = getGreeting("World");
    if (msg != "Hello, World") {
        throw new Error("getGreeting('World') should be 'Hello, World', got " + msg);
    }

    console.log("verified");
}
