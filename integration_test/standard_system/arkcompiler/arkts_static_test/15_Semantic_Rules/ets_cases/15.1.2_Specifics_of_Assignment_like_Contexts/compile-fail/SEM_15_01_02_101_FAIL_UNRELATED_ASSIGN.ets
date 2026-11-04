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
 * @id SEM_15_01_02_101_FAIL_UNRELATED_ASSIGN
 * @expect compile-fail
 * @section 15.1.2
 * @design 验证赋值上下文中不相关类拒绝：Dog 不可赋值给 Cat
 * @note 反向用例：无继承关系的类之间不可赋值
 */
class Animal { public name: string = ''; }
class Dog extends Animal { public breed: string = ''; }
class Cat extends Animal { public color: string = ''; }
function main(): void {
    let c: Cat;
    let d: Dog = new Dog();
    c = d;
}
