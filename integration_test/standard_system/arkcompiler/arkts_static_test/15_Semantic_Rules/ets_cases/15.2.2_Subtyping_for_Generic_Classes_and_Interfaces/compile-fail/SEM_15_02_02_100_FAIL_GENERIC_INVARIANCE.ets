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
 * @id SEM_15_02_02_100_FAIL_GENERIC_INVARIANCE
 * @expect compile-fail
 * @section 15.2.2
 * @design 验证泛型类不变性：Derived[] 不是 Base[] 的子类型
 * @note 反向用例：泛型类型不变，Derived[] 不可赋值给 Base[]
 */
class Base { public value: int= 0; }
class Derived extends Base { public extra: int= 0; }
function acceptBaseArray(arr: Base[]): void { console.log(`Length: ${arr.length}`); }
function main(): void {
    let derivedArr: Derived[] = [new Derived()];
    acceptBaseArray(derivedArr);
}
