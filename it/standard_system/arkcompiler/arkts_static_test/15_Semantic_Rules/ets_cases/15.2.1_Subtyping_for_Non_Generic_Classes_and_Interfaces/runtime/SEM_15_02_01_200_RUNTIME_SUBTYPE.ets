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
 * @id SEM_15_02_01_200_RUNTIME_SUBTYPE
 * @expect runtime
 * @section 15.2.1
 * @design 验证非泛型子类型运行时调用：父类引用调用子类方法
 * @note 运行时用例：Dog → Animal 赋值后多态派发正确
 */
class Animal { speak(): string { return '...'; } }
class Dog extends Animal { override speak(): string { return 'Woof!'; } }
function main(): void {
    let d: Dog = new Dog();
    let a: Animal = d;
    let s: string = a.speak();
    if (s != 'Woof!') { throw new Error('assertion failed: ' + s); }
console.log('verified');
}
