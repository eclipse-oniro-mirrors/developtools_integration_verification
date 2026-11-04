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
 * @id AMB_14_03_007_FAIL_OVERLOAD_UNDEFINED_REF
 * @expect compile-fail
 * @section 14.3
 * @design declare overload 引用未定义的函数名，违反 spec
 * @note 反向用例：overload 引用不存在的函数应产生编译时错误
 */
declare function foo1(p: string): void
declare overload foo {foo1, nonexistentFunc}
