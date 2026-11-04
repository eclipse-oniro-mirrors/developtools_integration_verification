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
 * @id NSM_13_03_005_PASS_NAMESPACE_EMBEDDED
 * @expect compile-pass
 * @section 13.3
 * @design Embedded namespaces are allowed
 */

namespace ExternalSpace {
  export function foo(): void {
    console.log('ExternalSpace.foo')
  }
  export let variable: number = 1234

    export namespace EmbeddedSpace {
        export const constant: int = 5678
    }
}

function main(): void {
    if (ExternalSpace.variable == ExternalSpace.EmbeddedSpace.constant) {
        ExternalSpace.variable = 4321
    }
    ExternalSpace.foo()
}
