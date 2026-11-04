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
 * @id AMB_14_03_006_PASS_OVERLOAD_USE_IN_FUNCTION
 * @expect compile-pass
 * @section 14.3
 * @design declare overload 声明后，在普通函数中调用重载函数，验证编译通过
 * @note 正向用例：验证 ambient overload 函数调用的编译通过
 */
declare function g1(p: string): void
declare function g2(p: number): void
declare overload g {g1, g2}

function testOverload(): void {
  g('hello')
  g(42)
}
