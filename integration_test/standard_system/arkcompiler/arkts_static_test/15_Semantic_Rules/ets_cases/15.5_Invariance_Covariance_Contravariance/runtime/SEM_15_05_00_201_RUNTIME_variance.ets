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
 * @id SEM_15_05_00_201_RUNTIME_variance
 * @expect runtime
 * @section 15.5
 * @design 验证变体运行时行为：协变返回值 + 逆变参数的实际方法派发
 * @note 运行时用例：验证协变/逆变在运行时行为正确
 */
class Animal { public name: string= ''; }
class Dog extends Animal { public breed: string= ''; }
function useDogFn(fn: (d: Dog) => string): string {
    let d: Dog = new Dog(); d.name = 'Rex'; d.breed = 'Lab';
    return fn(d);
}
function animalDesc(a: Animal): string {
    return 'Animal: ' + a.name;
}
function main(): void {
    let result: string = useDogFn(animalDesc);
    if (result != 'Animal: Rex') {
        throw new Error('assertion failed: expected 'Animal: Rex' got '' + result + ''');
    }
console.log('verified: ' + result);
}
