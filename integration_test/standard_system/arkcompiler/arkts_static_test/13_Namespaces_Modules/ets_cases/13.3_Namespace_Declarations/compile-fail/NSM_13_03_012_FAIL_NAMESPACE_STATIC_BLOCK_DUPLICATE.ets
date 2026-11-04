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
 * @id NSM_13_03_012_FAIL_NAMESPACE_STATIC_BLOCK_DUPLICATE
 * @expect compile-fail
 * @section 13.3
 * @design Only one static block is allowed in a namespace.
 *          Otherwise a compile-time error occurs.
 */

namespace NS {
  static {
    console.log('First static block')
  }
  static {
    console.log('Second static block') // Compile-time error: duplicate static block
  }
}
