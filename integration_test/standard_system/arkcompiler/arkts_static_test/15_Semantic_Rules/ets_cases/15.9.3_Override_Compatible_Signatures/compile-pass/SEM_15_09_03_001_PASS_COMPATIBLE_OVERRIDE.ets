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
 * @id SEM_15_09_03_001_PASS_COMPATIBLE_OVERRIDE
 * @expect compile-pass
 * @section 15.9.3
 * @design 验证覆写兼容签名：返回值协变 + 参数逆变时签名兼容
 * @note 正向用例：子类返回 Dog (<:Animal)，参数接受 Animal (>:Dog)
 */
class Animal { public name: string = ''; }
class Dog extends Animal { public breed: string = ''; }
class Base { process(a: Animal): Animal { return a; } }
class Derived extends Base {
    process(d: Dog): Dog { let r: Dog = new Dog(); r.name = d.name; r.breed = d.breed; return r; }
}
function main(): void {
    let obj: Derived = new Derived();
    let d: Dog = new Dog(); d.name = 'Rex'; d.breed = 'Lab';
    let r: Dog = obj.process(d);
    console.log(r.name);
}
