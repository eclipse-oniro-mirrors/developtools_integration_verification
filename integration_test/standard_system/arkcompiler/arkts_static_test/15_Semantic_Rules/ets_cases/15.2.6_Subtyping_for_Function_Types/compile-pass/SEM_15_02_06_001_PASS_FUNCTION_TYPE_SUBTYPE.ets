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
 * @id SEM_15_02_06_001_PASS_FUNCTION_TYPE_SUBTYPE
 * @expect compile-pass
 * @section 15.2.6
 * @design 验证函数类型子类型：参数逆变，返回值协变
 * @note 正向用例：(Animal) => Dog <: (Dog) => Animal（参数逆变 + 返回值协变）
 */
class Animal { public name: string= ''; }
class Dog extends Animal { public breed: string= ''; }
function childFn(a: Animal): Dog { let d: Dog = new Dog(); d.name = a.name; d.breed = 'mixed'; return d; }
function useParentFn(fn: (d: Dog) => Animal): void {
    let d: Dog = new Dog(); d.name = 'Buddy';
    let result: Animal = fn(d);
    console.log(`Result: ${result.name}`);
}
function main(): void {
useParentFn(childFn);
}
