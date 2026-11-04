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
 * @id SEM_15_11_10_001_PASS_polymorphic_dispatch
 * @expect compile-pass
 * @section 15.11.10
 * @design 方法调用动态解析：多态派发
 * @note 正向用例：子类覆写方法通过基类引用调用时动态派发
 */
class Animal { speak(): string { return '...'; } }
class Dog extends Animal { override speak(): string { return 'Woof!'; } }
function main(): void {
    let a: Animal = new Dog();
    let s: string = a.speak();
    console.log(s);
}
