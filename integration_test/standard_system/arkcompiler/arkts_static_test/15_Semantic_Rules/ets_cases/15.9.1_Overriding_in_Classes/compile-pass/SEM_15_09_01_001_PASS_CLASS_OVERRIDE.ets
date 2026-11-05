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
 * @id SEM_15_09_01_001_PASS_CLASS_OVERRIDE
 * @expect compile-pass
 * @section 15.9.1
 * @design 验证类方法覆写：子类 override 父类方法
 * @note 正向用例：Dog.speak() override Animal.speak()
 */
class Animal { speak(): string { return '...'; } }
class Dog extends Animal { override speak(): string { return 'Woof!'; } }
function main(): void {
    let d: Dog = new Dog();
    let s: string = d.speak();
    console.log(s);
}
