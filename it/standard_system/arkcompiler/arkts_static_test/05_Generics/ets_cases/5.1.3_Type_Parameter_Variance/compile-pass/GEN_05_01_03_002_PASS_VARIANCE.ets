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
 * @id GEN_05_01_03_002_PASS_VARIANCE
 * @expect compile-pass
 * @section 5.1.3
 * @design 类型别名上的 out/in 修饰被接受【设计问题：语义不明确】
 * @note out/in 在类型别名上无实际约束效果，编译器静默接受。Swift 不允许对 typealias 使用 variance。
 */
type Wrapper<out T> = T;
let a: Wrapper<number> = 42;
