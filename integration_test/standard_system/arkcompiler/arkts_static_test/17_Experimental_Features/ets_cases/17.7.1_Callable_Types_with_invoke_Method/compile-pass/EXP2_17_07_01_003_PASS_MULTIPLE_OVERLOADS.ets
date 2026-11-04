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
 * @id EXP2_17_07_01_003_PASS_MULTIPLE_OVERLOADS
 * @expect compile-pass
 * @section 17.7.1
 * @design 定义多个不同签名的 static $_invoke 重载（不同参数数量、不同类型），验证编译器根据参数推断正确的重载。
 * @note 正向用例：验证多个 $_invoke 重载编译通过
 */
class MultiInvoke {
    static $_invoke(): string {
        return 'no args'
    }

    static $_invoke(x: int): int {
        return x * 2
    }

    static $_invoke(x: int, y: int): int {
        return x + y
    }

    static $_invoke(s: string): string {
        return 'string: ' + s
    }
}

function testMultiInvoke(): void {
    let r0: string = MultiInvoke()
    let r1: int = MultiInvoke(5)
    let r2: int = MultiInvoke(3, 7)
    let r3: string = MultiInvoke('abc')
}
