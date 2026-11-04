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
 * @id NSM_13_03_007_PASS_NAMESPACE_QUALIFIED_SHORTCUT
 * @expect compile-pass
 * @section 13.3
 * @design Namespace name can be a qualified name (shortcut for embedded namespaces)
 *                   namespace A.B { } is shortcut for namespace A { export namespace B { } }
 */

namespace A.B.C {
  export function foo(): void {
    console.log('A.B.C.foo')
  }
}

function main(): void {
    A.B.C.foo() // Valid function call
}
