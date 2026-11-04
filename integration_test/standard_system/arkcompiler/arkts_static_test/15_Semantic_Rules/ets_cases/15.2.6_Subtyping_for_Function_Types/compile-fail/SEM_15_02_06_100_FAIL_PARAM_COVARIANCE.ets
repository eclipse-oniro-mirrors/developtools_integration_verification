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
 * @id SEM_15_02_06_100_FAIL_PARAM_COVARIANCE
 * @expect compile-fail
 * @section 15.2.6
 * @design 验证函数类型参数逆变违规拒绝：(Dog)=>void 不可用作 (Animal)=>void
 * @note 反向用例：参数协变时不可赋值，Dog <: Animal 但函数参数逆变
 */
class Animal { public name: string= ''; }
class Dog extends Animal { public breed: string= ''; }
function useAnimalFn(fn: (a: Animal) => void): void {}
function dogHandler(d: Dog): void {}
function main(): void {
useAnimalFn(dogHandler);
}
