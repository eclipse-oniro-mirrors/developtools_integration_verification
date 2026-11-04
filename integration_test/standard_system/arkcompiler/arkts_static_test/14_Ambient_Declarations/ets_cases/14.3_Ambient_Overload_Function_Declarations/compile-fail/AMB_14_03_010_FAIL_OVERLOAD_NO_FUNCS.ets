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
 * @id AMB_14_03_010_FAIL_OVERLOAD_NO_FUNCS
 * @expect compile-fail
 * @section 14.3
 * @design declare overload 引用未声明的标识符，没有预置的 declare function
 * @note 反向用例：overload 引用未声明的标识符应产生编译时错误
 */
declare overload baz {nonexistent}
