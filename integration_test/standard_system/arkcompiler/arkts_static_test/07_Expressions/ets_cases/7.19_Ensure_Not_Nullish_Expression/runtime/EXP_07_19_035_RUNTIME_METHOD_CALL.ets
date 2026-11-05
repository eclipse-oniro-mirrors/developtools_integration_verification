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
 * @id EXP_07_19_035_RUNTIME_METHOD_CALL
 * @expect runtime
 * @section 7.19
 * @design 验证 ! 方法调用在运行时非空时正常调用
 * @note 运行时用例：obj!.method() 正常调用
 */
class Calc {
    triple(n: int): int {
        return n * 3
    }
}

function main(): void {
    let c: Calc | undefined = new Calc()
    let r: int = c!.triple(10)
    if (r != 30) {
        throw new Error('assertion failed: expected 30, got ' + r)
    }
console.log('verified')
}
