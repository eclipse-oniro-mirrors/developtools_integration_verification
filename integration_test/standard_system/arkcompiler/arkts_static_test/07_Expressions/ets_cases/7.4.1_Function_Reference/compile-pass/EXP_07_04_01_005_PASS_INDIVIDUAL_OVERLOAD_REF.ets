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
 * @id EXP_07_04_01_005_PASS_INDIVIDUAL_OVERLOAD_REF
 * @expect compile-pass
 * @section 7.4.1
 * @design 单个显式重载函数引用：验证显式重载中单个函数名可以作为引用
 * @note 正向用例：foo2 是显式重载中的单个函数，可以作为引用编译通过
 */
function foo1(n: number): void {}
function foo2(s: string): void {}
overload foo { foo1, foo2 }

let y = foo2  // OK，引用单个显式重载函数
