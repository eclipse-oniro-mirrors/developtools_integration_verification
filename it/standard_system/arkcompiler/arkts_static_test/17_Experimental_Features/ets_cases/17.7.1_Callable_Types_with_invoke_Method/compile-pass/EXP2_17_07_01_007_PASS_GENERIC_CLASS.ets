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
 * @id EXP2_17_07_01_007_PASS_GENERIC_CLASS
 * @expect compile-pass
 * @section 17.7.1
 * @design 在泛型类中定义 static $_invoke 方法，但 $_invoke 不使用泛型类型参数（static 方法不能访问类型参数）。
 * @note 正向用例：验证泛型类中 $_invoke 不使用类型参数时编译通过
 */
class GenericInvoke<T> {
    static $_invoke(x: int): int {
        return x + 1
    }

    static $_invoke(s: string): string {
        return 'generic_' + s
    }
}

function testGenericInvoke(): void {
    let r1: int = GenericInvoke(10)
    let r2: string = GenericInvoke('test')
    let r3: int = GenericInvoke.$_invoke(100)
}
