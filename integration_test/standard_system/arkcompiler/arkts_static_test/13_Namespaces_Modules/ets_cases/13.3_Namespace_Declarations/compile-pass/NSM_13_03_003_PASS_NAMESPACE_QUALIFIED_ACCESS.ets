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
 * @id NSM_13_03_003_PASS_NAMESPACE_QUALIFIED_ACCESS
 * @expect compile-pass
 * @section 13.3
 * @design Exported namespace entity can be used in the form of qualifiedName
 *                   outside a namespace in the same module
 */

namespace NS1 {
  export let a: number = 1
  export function foo(): void {
    console.log('NS1.foo')
  }
}

function main(): void {
    let v: number = NS1.a
    NS1.foo()
}
