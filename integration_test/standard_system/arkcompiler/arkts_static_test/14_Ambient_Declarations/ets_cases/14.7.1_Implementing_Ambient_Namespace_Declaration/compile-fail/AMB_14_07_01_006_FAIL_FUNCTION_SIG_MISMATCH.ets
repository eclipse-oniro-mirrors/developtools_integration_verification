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
 * @id AMB_14_07_01_006_FAIL_FUNCTION_SIG_MISMATCH
 * @expect compile-fail
 * @section 14.7.1
 * @design ambient 函数与实现函数签名不匹配（参数类型不同），违反 spec
 * @note 反向用例：签名不匹配应产生编译时错误
 */
declare namespace A {
  function foo(x: int): void
}
namespace A {
  function foo(x: string): void {}
}
