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
 * @id SEM_15_12_00_103_FAIL_ERASURE_LIMIT
 * @expect compile-fail
 * @section 15.12
 * @design 验证 FixedArray 泛型擦除限制：擦除后类型不可作 FixedArray 类型参数
 * @note 反向用例：类型擦除后不可用于 FixedArray 实例化
 */
class Container<T> { public val: T | undefined; }
function main(): void {
    let arr: FixedArray<Container<int>> = new FixedArray<Container<int>>(3);
}
