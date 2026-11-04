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
 * @id SEM_15_02_05_200_RUNTIME_UNION_SUBTYPE
 * @expect runtime
 * @section 15.2.5
 * @design 验证联合类型子类型运行时行为
 * @note 运行时用例：联合类型各成员赋值后运行时值正确
 */
class Animal { public name: string = ''; }
class Dog extends Animal { public breed: string = ''; }
function main(): void {
    let d: Dog = new Dog(); d.name = 'Rex';
    let a: Animal = d;
    if (a.name != 'Rex') { throw new Error('assertion failed'); }
console.log('verified');
}
