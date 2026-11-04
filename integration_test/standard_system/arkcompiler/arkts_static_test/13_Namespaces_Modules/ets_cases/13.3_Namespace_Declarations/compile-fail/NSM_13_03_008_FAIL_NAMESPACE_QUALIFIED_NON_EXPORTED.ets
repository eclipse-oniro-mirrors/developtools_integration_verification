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
/*
 * @id NSM_13_03_008_FAIL_NAMESPACE_QUALIFIED_NON_EXPORTED
 * @expect compile-fail
 * @section 13.3
 * @design Using a qualifiedName for non-exported entity both inside and
 *                   outside a namespace causes a compile-time error
 */

namespace NS {
    export let a: number = 1
    let b: number = 2

    export function bar(): void {
        let v: number
        v = NS.b // Compile-time error, `b` not exported
    }
}

function main(): void {
    NS.b = 1 // Compile-time error, `NS.b` not exported
}
