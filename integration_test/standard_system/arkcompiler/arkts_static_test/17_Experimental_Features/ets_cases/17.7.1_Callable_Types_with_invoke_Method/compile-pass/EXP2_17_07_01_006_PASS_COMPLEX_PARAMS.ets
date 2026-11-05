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
 * @id EXP2_17_07_01_006_PASS_COMPLEX_PARAMS
 * @expect compile-pass
 * @section 17.7.1
 * @design 定义接受复杂参数类型（数组、boolean、多参数）的 static $_invoke 方法。
 * @note 正向用例：验证复杂参数类型的 $_invoke 编译通过
 */
class ComplexInvoke {
    static $_invoke(arr: int[]): int {
        return arr.length
    }

    static $_invoke(flag: boolean, value: int): string {
        if (flag) {
            return 'true_' + value
        }
        return 'false_' + value
    }
}

function testComplexInvoke(): void {
    let nums: int[] = [1, 2, 3, 4, 5]
    let len: int = ComplexInvoke(nums)
    let msg: string = ComplexInvoke(true, 42)
    let msg2: string = ComplexInvoke(false, 0)
}
