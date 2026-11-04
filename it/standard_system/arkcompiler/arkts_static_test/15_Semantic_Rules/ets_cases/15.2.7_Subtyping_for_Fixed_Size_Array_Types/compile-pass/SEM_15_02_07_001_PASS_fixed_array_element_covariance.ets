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
 * @id SEM_15_02_07_001_PASS_fixed_array_element_covariance
 * @expect compile-pass
 * @section 15.2.7
 * @design 验证 FixedArray 元素协变：FixedDerived[] 可作为 FixedBase[]
 * @note 正向用例：FixedArray 是内置特殊类型，设计为协变（类似 Java 数组）
 */
class Base { public value: int= 0; }
class Derived extends Base { public extra: int= 0; }
function acceptBase(arr: FixedBase[]): void {
    console.log(`${arr[0].value}`);
}
function main(): void {
    let derivedArr: FixedDerived[] = new FixedDerived[](3);
    acceptBase(derivedArr);
}
