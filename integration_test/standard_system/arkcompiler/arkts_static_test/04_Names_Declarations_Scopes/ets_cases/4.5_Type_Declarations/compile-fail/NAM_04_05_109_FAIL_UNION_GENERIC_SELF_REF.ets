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
 * @id NAM_04_05_109_FAIL_UNION_GENERIC_SELF_REF
 * @expect compile-fail
 * @section 4.5
 * @design 泛型类型别名的联合类型自身引用
 * @note 反向用例：type G<T> = T | G<T> 应报编译错误（无终止条件）
 *       规范 4.5.1 — 循环类型引用导致编译时错误
 */
type G<T> = T | G<T>;
