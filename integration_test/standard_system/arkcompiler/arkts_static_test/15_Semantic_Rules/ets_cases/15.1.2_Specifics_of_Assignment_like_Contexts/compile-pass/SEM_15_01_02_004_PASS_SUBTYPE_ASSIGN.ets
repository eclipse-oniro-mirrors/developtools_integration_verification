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
 * @id SEM_15_01_02_004_PASS_SUBTYPE_ASSIGN
 * @expect compile-pass
 * @section 15.1.2
 * @design 验证赋值上下文中子类型赋值：Dog → Animal 可赋值
 * @note 正向用例：子类型可赋值给基类型
 */
class Animal { public name: string= ''; }
class Dog extends Animal { public breed: string= ''; }
function main(): void {
    let a: Animal;
    let d: Dog = new Dog();
    d.name = 'Rex';
    a = d;
    console.log(`a=${a.name}`);
}
