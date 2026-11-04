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
 * @id AMB_14_03_002_PASS_NAMESPACE_OVERLOAD
 * @expect compile-pass
 * @section 14.3
 * @design declare overload 在 namespace 内的函数重载
 * @note 正向用例：验证 namespace 内 ambient overload 声明编译通过
 */
declare namespace N {
  function foo1(p: string): void
  function foo2(p: number): void
  overload foo {foo1, foo2}
}
