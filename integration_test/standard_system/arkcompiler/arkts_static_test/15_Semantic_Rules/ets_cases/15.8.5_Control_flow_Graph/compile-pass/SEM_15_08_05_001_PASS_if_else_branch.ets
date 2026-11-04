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
 * @id SEM_15_08_05_001_PASS_if_else_branch
 * @expect compile-pass
 * @section 15.8.5
 * @design 控制流图：if/else 分支类型
 * @note 正向用例：instanceof 检查后在分支内使用子类型
 */
class Animal { public name: string = ''; }
class Dog extends Animal { public breed: string = ''; }
function main(): void {
    let a: Animal = new Dog();
    if (a instanceof Dog) {
        console.log('verified');
}
}
