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
 * @id AMB_14_07_004_PASS_NS_NESTED
 * @expect compile-pass
 * @section 14.7
 * @design declare namespace 嵌套 namespace
 * @note 正向用例：验证嵌套 namespace 编译通过
 */
declare namespace A {
  export namespace B {
    export function foo(): void
  }
}
