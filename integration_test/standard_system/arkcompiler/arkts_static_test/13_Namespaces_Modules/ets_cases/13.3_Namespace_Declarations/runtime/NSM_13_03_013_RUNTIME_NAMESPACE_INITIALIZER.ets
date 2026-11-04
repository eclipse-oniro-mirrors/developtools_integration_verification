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
 * @id NSM_13_03_013_RUNTIME_NAMESPACE_INITIALIZER
 * @expect runtime
 * @section 13.3
 * @design Namespace initializer executed only if at least one exported
 *                   namespace member is used in the program
 */

namespace NS1 {
    export let variable: int = 1234
    export const constant: int = 5678
    export let someVar: string

  // Will be executed before any use of NS1 members
  someVar = 'some string'
}

namespace NS2 {
  export const constant: int = 1
  // Will never be executed since NS2 members are never used
  console.log('Init for NS2 done')
}

function main(): int {
  if (NS1.variable == NS1.constant) {
    NS1.variable = 4321
  }
  console.log(NS1.someVar)
  return NS1.someVar == 'some string' ? 0 : 1
}
