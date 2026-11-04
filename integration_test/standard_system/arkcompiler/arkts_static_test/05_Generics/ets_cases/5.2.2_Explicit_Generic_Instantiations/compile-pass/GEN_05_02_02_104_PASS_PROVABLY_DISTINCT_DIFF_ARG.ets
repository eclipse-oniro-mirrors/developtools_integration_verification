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
 * @id GEN_05_02_02_104_PASS_PROVABLY_DISTINCT_DIFF_ARG
 * @expect compile-pass
 * @section 5.2.2
 * @design 同一声明不同类型实参可证明不同
 * @note spec: provably distinct if any type argument is provably distinct
 */
class G104a<T> {}
let x104a: G104a<number> = new G104a<number>()
let y104a: G104a<string> = new G104a<string>()