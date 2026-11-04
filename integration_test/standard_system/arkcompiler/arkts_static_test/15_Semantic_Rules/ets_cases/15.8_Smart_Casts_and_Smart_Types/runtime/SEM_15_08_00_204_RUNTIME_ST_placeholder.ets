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
 * @id SEM_15_08_00_204_RUNTIME_ST_placeholder
 * @expect runtime
 * @section 15.8
 * @design 智能转换运行时：instanceof 分支执行
 * @note 运行时验证 instanceof 分支中智能类型转换正确性
 */
class Animal { public name: string = ''; }
class Dog extends Animal { public breed: string = ''; }
function main(): void {
    let a: Animal = new Dog();
    a.name = 'Rex';
    if (a instanceof Dog) {
        let d: Dog = a;
        d.breed = 'Lab';
        console.log(d.name + ' is a ' + d.breed);
    }
}
