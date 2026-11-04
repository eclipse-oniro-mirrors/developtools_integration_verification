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
 * @id SEM_15_10_02_001_PASS_METHOD_OVERLOAD_2
 * @expect compile-pass
 * @section 15.10.2
 * @design 方法重载可区分 - 编译器选择最佳匹配
 * @note foo(1) 解析为 foo(int) 通过
 */
class C { foo(x: int): void {} foo(x: double): void {} }
function main(): void { let c: C = new C(); c.foo(1); }
