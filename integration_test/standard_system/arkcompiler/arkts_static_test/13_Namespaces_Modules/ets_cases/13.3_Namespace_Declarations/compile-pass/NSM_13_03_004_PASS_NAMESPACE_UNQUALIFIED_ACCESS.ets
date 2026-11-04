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
 * @id NSM_13_03_004_PASS_NAMESPACE_UNQUALIFIED_ACCESS
 * @expect compile-pass
 * @section 13.3
 * @design Namespace entities can be used inside a namespace without qualification
 */

namespace NS {
    export let a: number = 1
    let b: number = 2

    export function foo(): void {
        let v: number = a // OK, no qualification needed
        v = b // OK, no qualification needed
        console.log(v.toString())
    }
}

function main(): void {
    NS.foo()
}
