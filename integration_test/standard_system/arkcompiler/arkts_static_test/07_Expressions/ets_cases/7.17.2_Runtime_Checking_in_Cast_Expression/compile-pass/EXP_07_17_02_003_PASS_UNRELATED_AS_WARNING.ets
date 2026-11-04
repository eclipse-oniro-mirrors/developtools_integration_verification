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
 * @id EXP_07_17_02_003_PASS_UNRELATED_AS_WARNING
 * @expect compile-pass
 * @section 7.17.2
 * @design 验证不相关子类 as 编译通过（编译时 warning: 始终抛 ClassCastError）
 * @note 正向用例：D as E (D, E 都继承 C 但互不相关) 编译通过，运行时抛 ClassCastError
 */
class C {}
class D extends C {}
class E extends C {}

function foo(d: D): void {
    let e: E = d as E
}
