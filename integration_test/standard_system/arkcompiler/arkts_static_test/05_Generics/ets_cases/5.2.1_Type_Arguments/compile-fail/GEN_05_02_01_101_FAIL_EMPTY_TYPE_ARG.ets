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
 * @id GEN_05_02_01_101_FAIL_EMPTY_TYPE_ARG
 * @expect compile-fail
 * @section 5.2.1
 * @design 空的类型实参列表应报编译时错误
 * @note spec: Type arguments are non-empty lists of types
 */
class G101<T> {}
let x101: G101<> = new G101<int>()
