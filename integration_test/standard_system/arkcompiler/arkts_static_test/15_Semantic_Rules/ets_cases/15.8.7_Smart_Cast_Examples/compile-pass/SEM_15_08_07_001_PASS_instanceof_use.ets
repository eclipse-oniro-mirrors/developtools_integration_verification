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
 * @id SEM_15_08_07_001_PASS_instanceof_use
 * @expect compile-pass
 * @section 15.8.7
 * @design 智能转换示例：典型 instanceof 使用
 * @note 正向用例：instanceof 检查后安全访问子类成员
 */
class Animal { public name: string = ''; }
class Dog extends Animal { public breed: string = ''; }
function describe(a: Animal): string {
    if (a instanceof Dog) { return 'Dog: ' + a.breed; }
    return 'Animal: ' + a.name;
}
function main(): void {
    let d: Dog = new Dog(); d.name = 'Rex'; d.breed = 'Lab';
    console.log(describe(d));
}
