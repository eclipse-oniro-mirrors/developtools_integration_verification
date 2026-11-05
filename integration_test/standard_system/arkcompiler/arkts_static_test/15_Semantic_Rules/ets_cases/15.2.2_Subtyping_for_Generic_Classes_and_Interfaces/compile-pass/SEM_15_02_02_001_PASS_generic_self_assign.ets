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
 * @id SEM_15_02_02_001_PASS_generic_self_assign
 * @expect compile-pass
 * @section 15.2.2
 * @design 泛型类自身子类型：相同类型参数的泛型实例可互相赋值
 * @note 正向用例：Holder<int> 类型实例可赋值给同类型变量
 */
class Holder<T> { public val: T | undefined; }
function main(): void {
    let a: Holder<int> = new Holder<int>();
    let b: Holder<int> = a;
    console.log('verified');
}
