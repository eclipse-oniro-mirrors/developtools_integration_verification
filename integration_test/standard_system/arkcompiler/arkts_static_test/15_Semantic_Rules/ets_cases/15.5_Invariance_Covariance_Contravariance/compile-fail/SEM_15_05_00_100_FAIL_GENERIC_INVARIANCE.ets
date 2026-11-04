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
 * @id SEM_15_05_00_100_FAIL_GENERIC_INVARIANCE
 * @expect compile-fail
 * @section 15.5
 * @design 验证泛型类型参数不变性：Holder<Derived> 不是 Holder<Base> 的子类型
 * @note 反向用例：泛型类型参数不变，派生类参数不可赋值给基类参数
 */
class Holder<T> { public val: T | undefined; }
class Base { public base: int = 0; }
class Derived extends Base { public derived: int = 0; }
function acceptHolderOfBase(b: Holder<Base>): void {
    console.log(`base`);
}
function main(): void {
    let derivedBox: Holder<Derived> = new Holder<Derived>();
    acceptHolderOfBase(derivedBox);
}
