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
 * @id SEM_15_05_00_006_PASS_PARAM_CONTRAVARIANCE
 * @expect compile-pass
 * @section 15.5
 * @design 验证函数参数逆变：Animal 处理器可作 Dog 参数的回调
 * @note 正向用例：参数逆变，(Animal)=>void 可赋值给 (Dog)=>void
 */
class Animal { public name: string= ''; }
class Dog extends Animal { public breed: string= ''; }
function useDogFn(fn: (d: Dog) => void): void {
    fn(new Dog());
}
function animalHandler(a: Animal): void {
    console.log(a.name);
}
function main(): void {
useDogFn(animalHandler);
}
