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
 * @id SEM_15_06_00_005_PASS_SUBTYPE_ARG
 * @expect compile-pass
 * @section 15.6
 * @design 验证子类型参数兼容：子类型参数可传父类型声明
 * @note 正向用例：Dog 参数传 Animal 声明（子类型兼容）
 */
class Animal { public name: string= ''; }
class Dog extends Animal { public breed: string= ''; }
function describe(a: Animal): string { return a.name; }
function main(): void {
    let d: Dog = new Dog(); d.name = 'Rex';
    let r: string = describe(d);
    console.log(`r=${r}`);
}
