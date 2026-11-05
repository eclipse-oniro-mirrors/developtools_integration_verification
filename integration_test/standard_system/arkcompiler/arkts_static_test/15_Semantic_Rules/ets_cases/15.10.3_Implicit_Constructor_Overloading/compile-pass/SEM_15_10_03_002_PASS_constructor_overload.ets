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
 * @id SEM_15_10_03_002_PASS_constructor_overload
 * @expect compile-pass
 * @section 15.10.3
 * @design Implicit constructor overloading by parameter type
 * @note Spec lines 14-26
 */
class BigFloat {
    constructor(n: number) {
        console.log('number')
    }
    constructor(s: string) {
        console.log('string')
    }
}
function main(): void {
    new BigFloat(1)
    new BigFloat('3.14')
}
