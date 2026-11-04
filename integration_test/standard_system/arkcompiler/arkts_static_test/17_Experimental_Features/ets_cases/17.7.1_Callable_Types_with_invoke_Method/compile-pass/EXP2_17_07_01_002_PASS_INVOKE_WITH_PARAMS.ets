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
 * @id EXP2_17_07_01_002_PASS_INVOKE_WITH_PARAMS
 * @expect compile-pass
 * @section 17.7.1
 * @design 定义有参数有返回值的 static $_invoke 方法，验证类型调用表达式接受对应参数并返回值。包含 int 加法、string 拼接两种重载。
 * @note 正向用例：验证有参有返回的 static $_invoke 编译通过
 */
class Calculator {
    static $_invoke(a: int, b: int): int {
        return a + b
    }

    static $_invoke(a: string, b: string): string {
        return a + b
    }
}

function testCalculator(): void {
    let r1: int = Calculator(2, 3)
    let r2: string = Calculator('Hello', 'World')
    let r3: int = Calculator.$_invoke(10, 20)
}
