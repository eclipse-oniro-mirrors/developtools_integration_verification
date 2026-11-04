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
 * @id GEN_05_02_02_103_PASS_PROVABLY_DISTINCT_DIFF_DECL
 * @expect compile-pass
 * @section 5.2.2
 * @design 不同泛型声明的实例化可证明不同
 * @note spec: provably distinct if parameterizations of distinct generic declarations
 */
class G103a<T> {}
class H103a<T> {}
let x103a: G103a<number> = new G103a<number>()
let y103a: H103a<number> = new H103a<number>()