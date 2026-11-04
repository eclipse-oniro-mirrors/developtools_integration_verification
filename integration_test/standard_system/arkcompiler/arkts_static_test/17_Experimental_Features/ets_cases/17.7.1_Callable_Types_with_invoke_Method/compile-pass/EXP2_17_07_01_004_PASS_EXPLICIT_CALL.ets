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
 * @id EXP2_17_07_01_004_PASS_EXPLICIT_CALL
 * @expect compile-pass
 * @section 17.7.1
 * @design 显式调用 ClassName.$_invoke(args)，验证与短形式 ClassName(args) 等价。同时验证两种形式可在同一文件中使用。
 * @note 正向用例：验证显式 $_invoke 调用编译通过
 */
class ExplicitCall {
    static $_invoke(a: int): int {
        return a + 100
    }

    static $_invoke(a: string): string {
        return '[' + a + ']'
    }
}

function testExplicitCall(): void {
    // 短形式
    let v1: int = ExplicitCall(1)
    let v2: string = ExplicitCall('test')

    // 显式形式
    let v3: int = ExplicitCall.$_invoke(5)
    let v4: string = ExplicitCall.$_invoke('hello')
}
