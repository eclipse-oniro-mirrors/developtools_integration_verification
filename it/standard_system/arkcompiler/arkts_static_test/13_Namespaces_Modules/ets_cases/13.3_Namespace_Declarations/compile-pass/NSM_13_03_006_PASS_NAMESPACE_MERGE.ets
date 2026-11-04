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
 * @id NSM_13_03_006_PASS_NAMESPACE_MERGE
 * @expect compile-pass
 * @section 13.3
 * @design Namespaces with identical name in a single module merge their
 *                   exported declarations into a single namespace
 */

namespace A {
  export function foo(): void {
    console.log('1st A.foo()')
  }
}

namespace A {
    export function goo(): void {
        foo() // calls merged foo()
        A.foo() // also OK
    }
}

function main(): void {
    A.goo()
}
