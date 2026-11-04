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
 * @id STMT_08_12_012_RUNTIME_return_in_lambda
 * @expect runtime
 * @section 8.12
 * @design 运行时验证lambda表达式中return语句正确返回计算结果
 * @note 运行时测试：验证lambda return值正确，覆盖算术运算和字符串操作
 */

function main(): void {
    let multiply: (a: int, b: int) => int = (a: int, b: int): int => {
        return a * b;
    };

    let r1: int = multiply(6, 7);
    if (r1 != 42) {
        throw new Error("multiply(6,7) should be 42, got " + r1);
    }

    let greet: (name: string) => string = (name: string): string => {
        return "Hi " + name + "!";
    };

    let r2: string = greet("ArkTS");
    if (r2 != "Hi ArkTS!") {
        throw new Error("greet('ArkTS') should be 'Hi ArkTS!', got " + r2);
    }

    console.log("verified");
}
