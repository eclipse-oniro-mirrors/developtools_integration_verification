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
 * @id STMT_08_12_007_PASS_return_subclass_assignable_to_base
 * @expect compile-pass
 * @section 8.12
 * @design 测试return表达式为子类类型时可赋值给父类返回类型
 * @note 正向测试：函数返回类型为Base，return Derived实例合法（Derived assignable to Base）；覆盖直接返回和条件分支返回
 */

class Animal {
    public name: string;
    constructor(name: string) {
        this.name = name;
    }
}

class Dog extends Animal {
    public breed: string;
    constructor(name: string, breed: string) {
        super(name);
        this.breed = breed;
    }
}

class Cat extends Animal {
    public color: string;
    constructor(name: string, color: string) {
        super(name);
        this.color = color;
    }
}

function getAnimal(kind: string): Animal {
    if (kind == "dog") {
        return new Dog("Buddy", "Golden");
    } else {
        return new Cat("Whiskers", "Gray");
    }
}

function getDefaultAnimal(): Animal {
    return new Dog("Rex", "Shepherd");
}
