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
 * @id CON_06_01_013_PASS_GENERIC_DECLARATION
 * @expect compile-pass
 * @section 6.1
 * @design Declaration context: 泛型声明上下文（let t: T = p）
 * @note 正向用例：验证该特性编译通过的正确用法
 */
function foo<T1, T2>(p1: T1, p2: T2): void {
  let t1: T1 = p1
  let t2: T2 = p2
}

function testGenericDeclaration(): void {
  foo<number, string>(42, 'hello')
  foo<int, boolean>(100, true)
}
