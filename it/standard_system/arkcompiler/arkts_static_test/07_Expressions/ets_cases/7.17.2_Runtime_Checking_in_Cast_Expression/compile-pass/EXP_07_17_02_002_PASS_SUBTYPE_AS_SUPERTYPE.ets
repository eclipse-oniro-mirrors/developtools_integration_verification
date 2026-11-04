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
 * @id EXP_07_17_02_002_PASS_SUBTYPE_AS_SUPERTYPE
 * @expect compile-pass
 * @section 7.17.2
 * @design 验证子类变量 as 超类编译通过（编译时 warning: 始终成功）
 * @note 正向用例：D as C (D extends C) 运行时总是成功
 */
class C {}
class D extends C {}

function foo(d: D): void {
    let c: C = d as C
}
