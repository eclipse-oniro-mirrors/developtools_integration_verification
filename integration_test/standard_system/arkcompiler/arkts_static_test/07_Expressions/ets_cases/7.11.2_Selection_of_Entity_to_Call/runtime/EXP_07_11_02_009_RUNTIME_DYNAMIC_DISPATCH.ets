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
 * @id EXP_07_11_02_009_RUNTIME_DYNAMIC_DISPATCH
 * @expect runtime
 * @section 7.11.2
 * @design 运行时动态分发：实例方法在运行时根据实际对象类型动态解析，子类覆盖的方法通过基类引用仍调用子类版本
 * @note 运行时用例：验证 Dynamic resolution of method calls 在运行时的多态行为
 */
class Animal {
    speak(): string {
        return 'Animal sound'
    }
}

class Dog extends Animal {
    speak(): string {
        return 'Woof'
    }
}

class Cat extends Animal {
    speak(): string {
        return 'Meow'
    }
}

function main(): void {
    let a1: Animal = new Dog()
    let a2: Animal = new Cat()

    let s1: string = a1.speak()
    if (s1 != 'Woof') {
        throw new Error('assertion failed: Dog should say Woof, got ' + s1)
    }

    let s2: string = a2.speak()
    if (s2 != 'Meow') {
        throw new Error('assertion failed: Cat should say Meow, got ' + s2)
    }
console.log('verified')
}
