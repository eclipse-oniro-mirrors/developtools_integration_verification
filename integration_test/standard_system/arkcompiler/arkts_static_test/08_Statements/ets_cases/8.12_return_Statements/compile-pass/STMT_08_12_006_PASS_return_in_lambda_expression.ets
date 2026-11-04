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
 * @id STMT_08_12_006_PASS_return_in_lambda_expression
 * @expect compile-pass
 * @section 8.12
 * @design 测试lambda表达式中return语句的使用，涵盖有表达式return和plain return
 * @note 正向测试：lambda中return带表达式（类型匹配）、void lambda中plain return均合法
 */

function testLambdaWithReturnExpr(): int {
    let f: (a: int, b: int) => int = (a: int, b: int): int => {
        return a + b;
    };
    return f(1, 2);
}

function testLambdaVoidBareReturn(): void {
    let f: (x: int) => void = (x: int): void => {
        if (x < 0) {
            return;
        }
        console.log("positive");
    };
    f(-1);
}

function testLambdaStringReturn(): string {
    let f: (s: string) => string = (s: string): string => {
        return "[" + s + "]";
    };
    return f("hello");
}
